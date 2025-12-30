{
  inputs,
  lib,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.programs = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    let
      cfg = config.modules.programs.nvf;
    in
    {
      imports = [ inputs.nvf.nixosModules.default ];

      options.modules.programs.nvf.enable = lib.mkEnableOption "Enable nvf";

      config = lib.mkIf (cfg.enable) {
        programs.nvf = {
          enable = true;

          settings.vim = {
            git.enable = true;
            hideSearchHighlight = true;
            searchCase = "smart";
            syntaxHighlighting = true;

            options = {
              shiftwidth = 2;
              tabstop = 4;
            };

            autocomplete.blink-cmp = {
              enable = true;
              friendly-snippets.enable = true;
              setupOpts.cmdline.keymap.preset = "super-tab";
            };

            utility = {
              motion.flash-nvim.enable = true;
              surround.enable = true;
            };

            terminal.toggleterm = {
              enable = true;
              mappings.open = "<leader>n";
              setupOpts.direction = "float";
            };

            filetree.neo-tree = {
              enable = true;
              setupOpts = {
                enable_cursor_hijack = true;
                git_status_async = true;
              };
            };

            telescope.enable = true;

            keymaps = [
              {
                key = "<A-q>";
                mode = "n";
                silent = true;
                action = ":wqall<CR>";
              }
              {
                key = "<leader>e";
                desc = "Toggle Neotree";
                mode = "n";
                silent = true;
                action = ":Neotree toggle<CR>";
              }
              {
                key = "<leader>bo";
                desc = "Close other buffers";
                mode = "n";
                silent = true;
                action = ":BufferLineCloseOthers<CR>";
              }
              {
                key = "<leader>bx";
                desc = "Close chosen buffer";
                mode = "n";
                silent = true;
                action = ":BufferLinePickClose<CR>";
              }
            ];

            binds.cheatsheet.enable = true;
            binds.whichKey = {
              enable = true;
              setupOpts.preset = "helix";
              register = {
                "<leader>d" = "DAP";
                "<leader>dg" = "Step";
                "<leader>dv" = "Go up/down stacktrace";

                "<leader>l" = "LSP";
                "<leader>lg" = "Go to";
                "<leader>lt" = "Toogle format";
                "<leader>lw" = "Workspace";

                "<leader>c" = "Git Conflict";
                "<leader>t" = "Git Blame";
              };
            };

            debugger.nvim-dap = {
              enable = true;
              ui.enable = true;
            };

            diagnostics = {
              enable = true;
              nvim-lint.enable = true;
              config = {
                signs = true;
                virtual_text = true;
              };
            };

            dashboard.alpha.enable = true;
            statusline.lualine.enable = true;
            tabline.nvimBufferline.enable = true;
            ui.noice.enable = true;

            projects.project-nvim.enable = true;

            visuals = {
              indent-blankline.enable = true;
              nvim-scrollbar.enable = true;
              rainbow-delimiters.enable = true;

              nvim-cursorline = {
                enable = true;
                setupOpts.cursorline.enable = true;
                setupOpts.cursorword.enable = true;
              };
            };

            languages = {
              enableDAP = true;
              enableExtraDiagnostics = true;
              enableFormat = true;
              enableTreesitter = true;

              clang.enable = true;
              css.enable = true;
              html.enable = true;
              json.enable = true;
              just.enable = true;
              python.enable = true;
              rust.enable = true;
              ts.enable = true;
              yaml.enable = true;

              markdown = {
                enable = true;
                extensions.markview-nvim.enable = true;
              };

              nix = {
                enable = true;
                format.type = [ "nixfmt" ];
                lsp.servers = [ "nixd" ];
              };
            };

            lsp = {
              enable = true;
              formatOnSave = true;
              harper-ls.enable = true;
              inlayHints.enable = true;
              lightbulb.enable = true;

              otter-nvim = {
                enable = true;
                setupOpts = {
                  buffers.write_to_disk = true;
                  diagnostic_update_event = [
                    "BufWritePost"
                    "InsertLeave"
                    "TextChanged"
                  ];
                  handle_leading_whitespace = true;
                };
              };
            };

            formatter.conform-nvim.enable = true;

            mini = {
              ai.enable = true;
              animate.enable = true;
              pairs.enable = true;
            };

            notes.todo-comments.enable = true;
          };
        };
      };
    }
  );
}
