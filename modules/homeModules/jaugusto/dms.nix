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
    {
      imports = [
        inputs.danksearch.homeModules.default
        inputs.dms.homeModules.dankMaterialShell.default
        inputs.dms.homeModules.dankMaterialShell.niri
        inputs.niri.homeModules.config
        inputs.niri.homeModules.stylix
      ];

      options.modules.dms.enable = lib.mkEnableOption "Enable DMS";

      config = {
        programs = {
          dsearch.enable = true;

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

          niri = {
            package = pkgs.niri;
            settings = {
              cursor.hide-when-typing = true;
              prefer-no-csd = true;

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

                  "Mod+Return" = {
                    action.spawn = "kitty";
                    hotkey-overlay.title = "Open kitty";
                  };
                  "Mod+E" = {
                    action.spawn = [
                      "flatpak"
                      "run"
                      "org.kde.dolphin"
                    ];
                    hotkey-overlay.title = "Open dolphin";
                  };
                  "Mod+W" = {
                    action.spawn = "zen";
                    hotkey-overlay.title = "Open zen browser";
                  };
                  "Mod+Q" = {
                    action = close-window;
                    hotkey-overlay.title = "Close current window";
                  };
                  "Mod+H" = {
                    action = focus-column-left;
                    hotkey-overlay.title = "Focus column to the left";
                  };
                  "Mod+L" = {
                    action = focus-column-right;
                    hotkey-overlay.title = "Focus column to the right";
                  };
                };

              environment = {
                DMS_PREFERRED_BATTERY = "/org/freedesktop/UPower/devices/battery_BAT1";
                DMS_SCEENSHOT_EDITOR = "satty";
              };

              hotkey-overlay = {
                hide-not-bound = true;
                skip-at-startup = true;
              };

              input = {
                focus-follows-mouse.enable = true;

                keyboard = {
                  xkb = {
                    layout = "br";
                    options = "caps:escape_shifted_capslock";
                  };
                };
              };

              layout = {
                default-column-display = "tabbed";
                default-column-width.proportion = 1.0;
              };
            };
          };
        };
      };
    }
  );
}
