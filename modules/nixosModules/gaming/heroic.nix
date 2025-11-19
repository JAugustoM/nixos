{ moduleWithSystem, ... }:
{
  flake.modules.nixos.gaming = moduleWithSystem (
    perSystem@{ pkgs, ... }:
    nixos@{ ... }:
    {
      environment.systemPackages = with pkgs; [
        heroic
      ];
    }
  );
}
