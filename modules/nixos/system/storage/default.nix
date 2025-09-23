{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "storage";
  cfg = config.modules.${moduleName};
in
{
  options = { };

  config = lib.mkIf (!config.modules.iso.isIso) {
    services.fstrim.enable = lib.mkDefault true;

    services.btrfs.autoScrub = {
      enable = lib.mkDefault true;
      interval = "weekly";
      fileSystems = [ "/" ];
    };
  };
}
