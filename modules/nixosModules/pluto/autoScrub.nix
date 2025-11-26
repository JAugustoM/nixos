{ moduleWithSystem, ... }:
{
  flake.modules.nixos.pluto = moduleWithSystem (
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
