{ inputs, moduleWithSystem, ... }:
{
  flake.modules.nixos.gaming = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ pkgs, ... }:
    {
      imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];

      programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];

        platformOptimizations.enable = true;
      };

      programs.gamemode.enable = true;
    }
  );
}
