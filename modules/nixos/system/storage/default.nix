{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "storage";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enableFstrim = lib.mkEnableOption "Enable fstrim";
      enableAutoScrub = lib.mkEnableOption "Enable btrfs auto scrub";
    };
  };

  config = {
    services.fstrim.enable = cfg.enableFstrim;

    services.btrfs.autoScrub = {
      enable = cfg.enableAutoScrub;
      interval = "weekly";
      fileSystems = [ "/" ];
    };
  };
}
