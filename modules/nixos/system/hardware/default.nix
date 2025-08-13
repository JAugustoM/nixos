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
  options = { };

  config = {
    hardware = lib.mkDefault {
      enableRedistributableFirmware = true;
    };
  };
}
