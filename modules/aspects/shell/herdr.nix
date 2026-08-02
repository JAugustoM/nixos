{ ... }:
{
  den.aspects.shell.herdr = { user, ... }: {
    homeManager = { lib, pkgs, ... }: {
      programs = {
        herdr = {
          enable = true;
          settings = {
            keys = {
              prefix = "ctrl+s";

              command = [
                {
                  command = "herdr plugin action invoke open-file-viewer --plugin herdr-file-viewer";
                  description = "Open file viewer";
                  key = "ctrl+f";
                  type = "shell";
                }
                {
                  command = "lazygit";
                  description = "Open lazygit";
                  key = "ctrl+g";
                  type = "pane";
                }
                {
                  command = "hx";
                  description = "Open helix";
                  key = "ctrl+e";
                  type = "pane";
                }
              ];
            };

            theme = {
              name = user.theme;
              auto_switch = true;
            };

            ui = {
              hide_tab_bar_when_single_tab = true;
              sidebar_start_collapsed = true;
            };
          };
        };

        fish.interactiveShellInit = ''
          if not set -q HERDR_ENV
            exec herdr
          end
        '';
      };

      home.activation = {
        herdrPluginsInstallation = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          export PATH="${
            lib.makeBinPath (
              with pkgs;
              [
                coreutils
                gcc
                git
                cargo
                rustc
              ]
            )
          }:$PATH"
          ${pkgs.herdr}/bin/herdr plugin install smarzban/herdr-file-viewer --yes
        '';
      };
    };
  };
}
