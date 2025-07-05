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
    };
  };

  config = lib.mkIf cfg.enable {
    services.power-profiles-daemon.enable = false;
    services.tlp = {
      enable = true;
    };
  };
}
