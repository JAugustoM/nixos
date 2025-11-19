{ moduleWithSystem, ... }:
{
  flake.modules.nixos.podman = moduleWithSystem (
    perSystem@{ pkgs, ... }:
    nixos@{ ... }:
    {
      virtualisation.containers.enable = true;
      virtualisation = {
        podman.enable = true;

      };
      environment.systemPackages = with pkgs; [
        podman-compose
        podman-desktop
      ];
    }
  );
}
