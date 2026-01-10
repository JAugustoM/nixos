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

            window-rules = [
              {
                matches = [
                  { title = "Picture-in-Picture"; }
                ];
                open-floating = true;
                opacity = 0.7;

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
