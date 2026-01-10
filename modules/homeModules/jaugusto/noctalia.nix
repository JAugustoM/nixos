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
        home.packages = with pkgs; [
          cava
          matugen
          wlsunset
        ];

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
                "XF86AudioRaiseVolume" = {
                  action = noctalia-ipc "call" "volume" "increase";
                  hotkey-overlay.title = "Increase volume";
                };
                "XF86AudioLowerVolume" = {
                  action = noctalia-ipc "call" "volume" "decrease";
                  hotkey-overlay.title = "Decrease volume";
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

            spawn-at-startup = [
              {
                command = [
                  "${pkgs.kdePackages.kservice}/bin/kbuildsycoca6"
                  "--noincremental"
                ];
              }
              { command = [ "${pkgs.kdePackages.kded}/bin/kded6" ]; }
            ];
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

          swaylock.enable = true;
        };

        services.swayidle =
          let
            lock = "${pkgs.swaylock}/bin/swaylock -f";
            suspend = "${pkgs.systemd}/bin/systemctl suspend";
            display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
          in
          {
            enable = true;
            systemdTarget = "noctalia-shell.service";
            events = {
              "before-sleep" = (display "off") + "; " + lock;
              "after-resume" = display "on";
              "lock" = (display "off") + "; " + lock;
              "unlock" = display "on";
            };

            timeouts = [
              {
                timeout = 60;
                command = lock;
              }
              {
                timeout = 90;
                command = display "off";
                resumeCommand = display "on";
              }
              {
                timeout = 120;
                command = suspend;
              }
            ];
          };
        systemd.user = {
          services.noctalia-shell = {
            Service.Environment = [
              ''QML2_IMPORT_PATH=${
                let
                  qmlPath = pkgs.qt6.qtbase.qtQmlPrefix;
                  modules = with pkgs.kdePackages; [
                    kirigami
                    breeze
                  ];
                in
                lib.concatStringsSep ":" (map (p: "${p}/${qmlPath}") modules)
              }''
            ];
            Unit.ConditionEnvironment = "XDG_CURRENT_DESKTOP=niri";
          };
        };

        xdg.configFile."menus/applications.menu".source =
          "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
      };
    }
  );
}
