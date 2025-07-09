{
  config,
  lib,
  virtual,
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
      enviroment = lib.mkOption {
        description = "Desktop enviroment to use";
        default = "plasma";
        type = types.enum [
          "cosmic"
          "gnome"
          "plasma"
        ];
      };
    };
  };

  config = lib.mkIf (!virtual) {
    services = lib.mkMerge [
      (lib.mkIf (cfg.enviroment == "cosmic") {
        desktopManager.cosmic.enable = true;
        desktopManager.cosmic.xwayland.enable = true;
        displayManager.cosmic-greeter.enable = true;
      })
      (lib.mkIf (cfg.enviroment == "gnome") {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      })
      (lib.mkIf (cfg.enviroment == "plasma") {
        displayManager.sddm = {
          enable = true;
          wayland.enable = true;
        };
        desktopManager.plasma6.enable = true;
      })
    ];
  };
}
