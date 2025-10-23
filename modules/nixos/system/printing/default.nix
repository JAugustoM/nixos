{
  config,
  lib,
  virtual,
  ...
}:
let
  types = lib.types;
  moduleName = "printing";
  cfg = config.modules.${moduleName};
in
{
  options = { };
  config = lib.mkIf (!virtual) {
    services.printing.enable = lib.mkDefault true;
  };
}
