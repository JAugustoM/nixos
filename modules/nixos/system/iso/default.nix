{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "iso";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      isIso = lib.mkEnableOption "Enable if it is iso";
    };
  };
}
