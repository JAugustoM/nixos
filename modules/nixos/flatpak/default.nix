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
      enable = lib.mkEnableOption "Enable Flatpaks";
      packages = lib.mkOption {
        description = "Flatpaks to install";
        type = types.listOf types.str;
        default = [];
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.flatpak = {
      enable = true;
      packages = cfg.packages;
      update.auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };
}
