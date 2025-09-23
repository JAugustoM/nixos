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

  config = lib.mkIf (!config.modules.iso.isIso) {
    hardware = {
      enableRedistributableFirmware = lib.mkDefault true;
    };
  };
}
