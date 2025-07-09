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

  config = {
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
