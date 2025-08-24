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
  config = {
    services.printing.enable = lib.mkDefault true;
  };
}
