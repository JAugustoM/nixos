{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "bluetooth";
  cfg = config.modules.${moduleName};
in
{
  options = { };

  config = lib.mkIf (!config.modules.iso.isIso) {
    hardware.bluetooth = lib.mkDefault {
      enable = true;
      powerOnBoot = true;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };
}
