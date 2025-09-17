{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "tlp";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable TLP";
      settings = lib.mkOption {
        type = types.attrsOf (types.either types.str types.int);
        description = "TLP settings";
        default = { };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.power-profiles-daemon.enable = false;
    services.tlp = {
      enable = true;
      settings = cfg.settings;
    };
  };
}
