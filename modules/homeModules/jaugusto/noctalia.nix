{
  inputs,
  lib,
  moduleWithSystem,
  ...
}:
let
  readJson = file: builtins.fromJSON (builtins.readFile file);
in
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, pkgs, ... }:
    let
      cfg = config.modules.niri;
    in
    {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      config = lib.mkIf (cfg.shell == "noctalia") {
        programs = {
          niri.settings = {
            binds =
              with config.lib.niri.actions;
              let
                noctalia-ipc = spawn "noctalia-shell" "ipc";
              in
              {
                "Mod+Space" = {
                  action = noctalia-ipc "call" "launcher" "toggle";
                  hotkey-overlay.title = "Toogle launcher";
                };
                "Mod+S" = {
                  action = noctalia-ipc "call" "controlCenter" "toggle";
                  hotkey-overlay.title = "Toogle control center";
                };
                "Mod+Comma" = {
                  action = noctalia-ipc "call" "settings" "toggle";
                  hotkey-overlay.title = "Toogle settings";
                };
                "XF86AudioPlay" = {
                  action = noctalia-ipc "call" "media" "playPause";
                  hotkey-overlay.title = "Play/Pause media";
                };
                "XF86AudioRaiseVolume" = {
                  action = noctalia-ipc "call" "volume" "increase";
                  hotkey-overlay.title = "Increase volume";
                };
                "Alt+XF86AudioRaiseVolume" = {
                  action = noctalia-ipc "call" "media" "next";
                  hotkey-overlay.title = "Next media track";
                };
                "XF86AudioLowerVolume" = {
                  action = noctalia-ipc "call" "volume" "decrease";
                  hotkey-overlay.title = "Decrease volume";
                };
                "Alt+XF86AudioLowerVolume" = {
                  action = noctalia-ipc "call" "media" "previous";
                  hotkey-overlay.title = "Previous media track";
                };
                "XF86AudioMute" = {
                  action = noctalia-ipc "call" "volume" "muteOutput";
                  hotkey-overlay.title = "Mute volume";
                };
                "XF86MonBrightnessUp" = {
                  action = noctalia-ipc "call" "brightness" "increase";
                  hotkey-overlay.title = "Increase brightness";
                };
                "XF86MonBrightnessDown" = {
                  action = noctalia-ipc "call" "brightness" "decrease";
                  hotkey-overlay.title = "Decrease brightness";
                };
                "Mod+V" = {
                  action = noctalia-ipc "call" "launcher" "clipboard";
                  hotkey-overlay.title = "Open clipboard";
                };
                "Mod+X" = {
                  action = noctalia-ipc "call" "sessionMenu" "toggle";
                  hotkey-overlay.title = "Open session menu";
                };
              };
          };

          noctalia-shell = {
            enable = true;
            systemd.enable = true;
            settings = {
              appLauncher = {
                enableClipboardHistory = true;
                useApp2Unit = true;
                terminalCommand = "kitty -e";
              };
              bar = {
                outerCorners = false;
                widgets = readJson ./include/noctalia/bar-widgets.json;
              };
              location = {
                name = "Distrito Federal";
              };
              nightLight = {
                enabled = true;
                autoSchedule = true;
              };
            };
          };
        };

        systemd.user.services.noctalia-shell = {
          Unit.ConditionEnviroment = "XDG_CURRENT_DESKTOP=niri";
          Service.Environment = [
            "QT_QPA_PLATFORMTHEME=Basic"
          ];
        };

        services.swayidle =
          let
            noctalia-shell = "${config.programs.noctalia-shell.package}/bin/noctalia-shell";
          in
          {
            enable = true;
            systemdTarget = "noctalia-shell.service";

            events = {
              before-sleep = "${noctalia-shell} ipc call lockScreen lock";
              lock = "${noctalia-shell} ipc call lockScreen lock";
            };

            timeouts = [
              {
                timeout = 60;
                command = "${noctalia-shell} ipc call lockScreen lock";
              }

              {
                timeout = 90;
                command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
              }

              {
                timeout = 120;
                command = "${noctalia-shell} ipc call sessionMenu lockAndSuspend";
              }
            ];
          };
      };
    }
  );
}
