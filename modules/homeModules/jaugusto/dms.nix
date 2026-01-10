{
  inputs,
  lib,
  moduleWithSystem,
  ...
}:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, pkgs, ... }:
    let
      cfg = config.modules.niri;
    in
    {
      imports = [
        inputs.dms.homeModules.dankMaterialShell.default
        inputs.dms.homeModules.dankMaterialShell.niri
      ];

      config = lib.mkIf (cfg.shell == "dms") {
        home.packages = with pkgs; [
          satty
          wl-mirror
        ];

        programs = {
          dankMaterialShell = {
            enable = true;

            niri = {
              enableKeybinds = true;
              enableSpawn = true;
            };
          };

          niri.settings = {
            binds =
              with config.lib.niri.actions;
              let
                dms-ipc = spawn "dms" "ipc";
              in
              {
                "Print" = {
                  action = dms-ipc "call" "niri" "screenshot";
                  hotkey-overlay.title = "Screenshot";
                };
                "Ctrl+Print" = {
                  action = dms-ipc "call" "niri" "screenshotScreen";
                  hotkey-overlay.title = "Screenshot current screen";
                };
                "Alt+Print" = {
                  action = dms-ipc "call" "niri" "screenshotWindow";
                  hotkey-overlay.title = "Screenshot current window";
                };
              };

            environment = {
              DMS_PREFERRED_BATTERY = "/org/freedesktop/UPower/devices/battery_BAT1";
              DMS_SCEENSHOT_EDITOR = "satty";
            };
          };
        };
      };
    }
  );
}
