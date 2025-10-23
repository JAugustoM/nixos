{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "hardware";
  cfg = config.modules.${moduleName};
in
{
  options = { };

  config = {
    hardware = {
      enableRedistributableFirmware = lib.mkDefault true;
    };
  };
}
