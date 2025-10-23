{
  config,
  lib,
  virtual,
  ...
}:
let
  types = lib.types;
  moduleName = "storage";
  cfg = config.modules.${moduleName};
in
{
  options = { };

  config = lib.mkIf (!virtual) {
    services.fstrim.enable = lib.mkDefault true;

    services.btrfs.autoScrub = {
      enable = lib.mkDefault true;
      interval = "weekly";
      fileSystems = [ "/" ];
    };
  };
}
