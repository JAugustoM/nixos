{ ... }:
{
  flake.modules.nixos.docker = {
    virtualisation = {
      docker.enable = true;
      docker.storageDriver = "btrfs";
    };
  };
}
