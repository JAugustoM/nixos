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
        inputs.niri.homeModules.config
        inputs.niri.homeModules.stylix
      ];

      options.modules.niri = {
        enable = lib.mkEnableOption "Enable niri";
        shell = lib.mkOption {
          type = lib.types.enum [
            ""
            "dms"
            "noctalia"
          ];
          default = "";
          description = "Shell to use with niri";
        };
      };

      config = lib.mkIf cfg.enable {
        dconf.settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = lib.mkForce "prefer-dark";
            gtk-theme = lib.mkForce "adw-gtk3";
          };
        };

        programs.niri = {
          package = pkgs.niri;
          settings = {
            cursor.hide-when-typing = true;
            prefer-no-csd = true;

            binds = with config.lib.niri.actions; {
              "Mod+Return" = {
                action = spawn "kitty";
                hotkey-overlay.title = "Open kitty";
              };
              "Mod+E" = {
                action = spawn "dolphin";
                hotkey-overlay.title = "Open dolphin";
              };
              "Mod+W" = {
                action = spawn "zen";
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
              NIXOS_OZONE_WL = "1";
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

            outputs.eDP-1 = {
              scale = 1.25;
              variable-refresh-rate = true;
            };

            spawn-at-startup = [
              {
                command = [
                  "kbuildsycoca6"
                  "--noincremental"
                ];
              }
            ];

            window-rules = [
              {
                matches = [
                  { title = "Picture-in-Picture"; }
                ];
                open-floating = true;

                default-column-width.fixed = 480;
                default-window-height.fixed = 270;
                default-floating-position = {
                  relative-to = "bottom-right";
                  x = 0;
                  y = 0;
                };
              }
            ];
          };
        };
      };
    }
  );
}
