{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "flatpak";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable flatpak";
    };
  };

  config = lib.mkIf cfg.enable {
    services.flatpak = {
      enable = lib.mkDefault true;
      update.auto = lib.mkDefault {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };
}
