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
        inputs.danksearch.homeModules.default
        inputs.dms.homeModules.dank-material-shell
        inputs.dms.homeModules.niri
        inputs.dms-plugin-registry.modules.default
      ];

      config = lib.mkIf (cfg.shell == "dms") {
        home.packages = with pkgs; [
          satty
          wl-mirror
        ];

        programs = {
          dsearch.enable = true;
          dank-material-shell = {
            enable = true;
            enableSystemMonitoring = false;

            niri = {
              enableKeybinds = true;
              enableSpawn = true;
              includes.enable = false;
            };

            session = {
              nightModeAutoEnabled = true;
              nightModeAutoMode = "location";
              nvidiaGpuTempEnabled = true;
              wallpaperPath = "/home/jaugusto/.config/nixos/modules/nixosModules/desktop/wallpapers/City.jpg";
              weatherCoordinates = "-15.7939869,-47.8828000";
            };

            plugins = {
              dankBatteryAlerts.enable = true;
              dankLauncherKeys.enable = true;
              displayMirror.enable = true;
              emojiLauncher.enable = true;
              powerUsagePlugin.enable = true;
              webSearch.enable = true;
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
              DMS_SCEENSHOT_EDITOR = "satty";
            };
          };
        };
      };
    }
  );
}
