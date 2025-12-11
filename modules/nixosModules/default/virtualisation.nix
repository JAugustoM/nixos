{ lib, moduleWithSystem, ... }:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    let
      cfg = config.modules.virtualisation;
      inherit (lib.types) listOf enum;
    in
    {
      options.modules.virtualisation.backends = lib.mkOption {
        type = listOf (enum [
          "docker"
          "podman"
        ]);
        default = [ ];
        description = "Virtualisation backends to use";
      };

      config = lib.mkMerge [
        (lib.mkIf (builtins.elem "docker" cfg.backends) {
          virtualisation = {
            docker.enable = true;
            docker.storageDriver = "btrfs";
          };
        })
        (lib.mkIf (builtins.elem "podman" cfg.backends) {
          virtualisation = {
            containers.enable = true;
            podman.enable = true;
          };
        })
      ];
    }
  );
}
