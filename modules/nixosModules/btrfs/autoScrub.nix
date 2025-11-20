{ moduleWithSystem, ... }:
{
  flake.modules.nixos.btrfs = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      services.btrfs.autoScrub = {
        enable = true;
        interval = "weekly";
        fileSystems = [ "/" ];
      };
    }
  );
}
