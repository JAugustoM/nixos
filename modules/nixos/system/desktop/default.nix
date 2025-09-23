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

  config = lib.mkIf (!config.modules.iso.isIso) {
    services = lib.mkMerge [
      (lib.mkIf (cfg.enviroment == "plasma") {
        displayManager.sddm = {
          enable = true;
          wayland.enable = true;
        };
        desktopManager.plasma6.enable = true;
      })
      (lib.mkIf (cfg.enviroment == "gnome") {
        displayManager.gdm = {
          enable = true;
        };
        desktopManager.gnome.enable = true;
      })
    ];
  };
}
