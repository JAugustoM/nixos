{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "desktop";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable desktop enviroment";
      enviroment = lib.mkOption {
        description = "Desktop enviroment to use";
        default = "plasma";
        type = types.enum [
          "gnome"
          "plasma"
        ];
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.displayManager = lib.mkMerge [
      (lib.mkIf (cfg.enviroment == "plasma") {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
      })
      (lib.mkIf (cfg.enviroment == "gnome") {
        gdm = {
          enable = true;
        };
      })
    ];

    services.desktopManager = lib.mkMerge [
      (lib.mkIf (cfg.enviroment == "plasma") {
        plasma6.enable = true;
      })
      (lib.mkIf (cfg.enviroment == "gnome") {
        gnome.enable = true;
      })
    ];
  };
}
