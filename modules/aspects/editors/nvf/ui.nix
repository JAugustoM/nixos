{
  den.aspects.editors.nvf.ui = {
    nixos.programs.nvf.settings.vim = {
      dashboard.alpha.enable = true;
      statusline.lualine = {
        enable = true;
        integrations.breadcrumbs = {
          navbuddy.enable = true;
          nvim-navic.enable = true;
        };
      };
      tabline.nvimBufferline.enable = true;

      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          close_if_last_window = true;
          git_status_async = true;

          default_component_configs = {
            indent = {
              with_expanders = true;
              expander_collapsed = "";
              expander_expanded = "";
              expander_highlight = "NeoTreeExpander";
            };
            git_status = {
              symbols = {
                unstaged = "󰄱";
                staged = "󰱒";
              };
            };
          };

          filesystem = {
            bind_to_cwd = false;
            follow_current_file.enabled = true;
            use_libuv_file_watcher = true;
          };

          open_files_do_not_replace_types = [
            "terminal"
            "Trouble"
            "trouble"
            "qf"
            "Outline"
          ];

          sources = [
            "filesystem"
            "buffers"
            "git_status"
          ];

          window.mappings = {
            "l" = "open";
            "h" = "close_node";
            "<space>" = "none";
          };
        };
      };

      ui = {
        colorful-menu-nvim.enable = true;
        colorizer.enable = true;
        fastaction.enable = true;
        illuminate.enable = true;
        smartcolumn.enable = true;

        noice = {
          enable = true;
          setupOpts.lsp.signature.enable = true;
        };
      };

      visuals = {
        indent-blankline.enable = true;
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
      };
    };
  };
}
