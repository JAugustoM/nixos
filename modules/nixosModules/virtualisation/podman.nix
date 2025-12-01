{ moduleWithSystem, ... }:
{
  flake.modules.nixos.podman = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ pkgs, ... }:
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
