{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "hardware";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      ssdEnable = lib.mkEnableOption "Enable ssd options";
    };
  };

  config = {
    services.fstrim.enable = cfg.ssdEnable;

    hardware = lib.mkDefault {
      enableRedistributableFirmware = true;
    };
  };
}
