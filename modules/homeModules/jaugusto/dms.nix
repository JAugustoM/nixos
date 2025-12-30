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
        inputs.dms.homeModules.dankMaterialShell.default
        inputs.dms.homeModules.dankMaterialShell.niri
        inputs.niri.homeModules.config
        inputs.niri.homeModules.stylix
      ];

      programs.dankMaterialShell = {
        enable = true;
        niri.enableKeybinds = true;

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

      programs.niri = {
        package = pkgs.niri;
        settings = {
          prefer-no-csd = true;

          binds =
            with config.lib.niri.actions;
            let
              dms-ipc = spawn "dms" "ipc";
            in
            {
              "Print".action = dms-ipc "call" "niri" "screenshot";
              "Ctrl+Print".action = dms-ipc "call" "niri" "screenshotScreen";
              "Alt+Print".action = dms-ipc "call" "niri" "screenshotWindow";

              # Custom
              "Mod+Return".action.spawn = "kitty";
              "Mod+E".action.spawn = "dolphin";
              "Mod+Q".action = close-window;
            };

          cursor = {
            hide-when-typing = true;
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
        };
      };

      xdg.configFile."dms" = {
        enable = true;
        target = "environment.d/90-dms.conf";
        text = ''
          DMS_PREFERRED_BATTERY=/org/freedesktop/UPower/devices/battery_BAT1;
          DMS_SCEENSHOT_EDITOR=satty;
        '';
      };
    }
  );
}
