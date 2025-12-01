{ moduleWithSystem, ... }:
{
  flake.modules.nixos.gaming = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        heroic
      ];
    }
  );
}
