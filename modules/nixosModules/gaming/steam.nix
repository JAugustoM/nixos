{ moduleWithSystem, ... }:
{
  flake.modules.nixos.gaming = moduleWithSystem (
    perSystem@{ pkgs, ... }:
    nixos@{ ... }:
    {
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
