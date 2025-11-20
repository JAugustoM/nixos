{ moduleWithSystem, ... }:
{
  flake.modules.nixos.docker = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      virtualisation = {
        docker.enable = true;
        docker.storageDriver = "btrfs";
      };
    }
  );
}
