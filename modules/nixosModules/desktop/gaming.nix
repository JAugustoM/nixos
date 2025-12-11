{
  inputs,
  lib,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, pkgs, ... }:
    let
      cfg = config.modules.gaming;
      inherit (lib.types) listOf enum;
    in
    {
      imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];

      options.modules.gaming.platforms = lib.mkOption {
        type = listOf (enum [
          "heroic"
          "steam"
        ]);
        default = [ ];
        description = "Gaming platforms to use";
      };

      config = lib.mkMerge [
        (lib.mkIf ((builtins.length cfg.platforms) != 0) {
          programs.gamemode.enable = true;
        })
        (lib.mkIf (builtins.elem "heroic" cfg.platforms) {
          environment.systemPackages = with pkgs; [
            heroic
          ];
        })
        (lib.mkIf (builtins.elem "steam" cfg.platforms) {
          programs.steam = {
            enable = true;
            gamescopeSession.enable = true;
            extraCompatPackages = with pkgs; [
              proton-ge-bin
            ];

            platformOptimizations.enable = true;
          };
        })
      ];
    }
  );
}
