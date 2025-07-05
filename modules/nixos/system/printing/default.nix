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
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable Printing";
    };
  };
  config = lib.mkIf cfg.enable {
    services.printing.enable = true;
  };
}
