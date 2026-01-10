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
            enableSystemMonitoring = false;

            niri = {
              enableKeybinds = true;
              enableSpawn = true;
            };

            plugins = {
              "Display Mirror" = {
                enable = true;
                src = pkgs.fetchFromGitHub {
                  owner = "jfchenier";
                  repo = "dms-display-mirror";
                  rev = "92cd44c4fb67834bf71fdd78f83c29df5e0750b2";
                  hash = "sha256-JX3pDZ1F5Uu/rOdA4KMhcwH8a6gxsTZjwgcZxNV/Ngc=";
                };
              };
              "Dank Battery Alerts" = {
                enable = true;
                src = pkgs.fetchFromGitHub {
                  owner = "AvengeMedia";
                  repo = "dms-plugins";
                  rev = "8fa7c5286171c66a209dd74e9a47d6e72ccfdad6";
                  hash = "sha256-iKz3cyWkLRyVH2kT6lY8GghTXIE2qu6ZqDEUvhZQWUc=";
                  rootDir = "DankBatteryAlerts";
                };
              };
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
