{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "printing";
  cfg = config.modules.${moduleName};
in
{
  options = { };
  config = lib.mkIf (!config.modules.iso.isIso) {
    services.printing.enable = lib.mkDefault true;
  };
}
