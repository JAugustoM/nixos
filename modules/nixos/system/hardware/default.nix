{
  config,
  lib,
  virtual,
  ...
}:
let
  types = lib.types;
  moduleName = "hardware";
  cfg = config.modules.${moduleName};
in
{
  options = { };

  config = lib.mkIf (!virtual) {
    hardware = {
      enableRedistributableFirmware = lib.mkDefault true;
    };
  };
}
