{
  den.aspects.editors.nvf.lsp = {
    nixos.programs.nvf.settings.vim = {
      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;

        setupOpts = {
          completion.list.selection = {
            auto_insert = true;
            preselect = false;
          };

          cmdline = {
            completion.list.selection = {
              auto_insert = true;
              preselect = false;
            };
            keymap.preset = "super-tab";
          };
        };

        sourcePlugins = {
          emoji.enable = true;
          ripgrep.enable = true;
        };
      };

      diagnostics = {
        enable = true;
        nvim-lint.enable = true;
        config = {
          signs = true;
          virtual_text = true;
        };
      };

      languages = {
        enableDAP = true;
        enableExtraDiagnostics = true;
        enableFormat = true;
        enableTreesitter = true;

        clang.enable = true;
        cmake.enable = true;
        go.enable = true;
        json.enable = true;
        just.enable = true;
        markdown.enable = true;
        sql.enable = true;
        toml.enable = true;
        xml.enable = true;
        yaml.enable = true;

        nix = {
          enable = true;
          format.type = [ "nixfmt" ];
          lsp.servers = [ "nixd" ];
        };

        python = {
          enable = true;
          format.type = [ "ruff" ];
          lsp.servers = [ "pyrefly" ];
        };

        rust = {
          enable = true;
          extensions.crates-nvim.enable = true;
        };
      };

      lsp = {
        enable = true;
        formatOnSave = true;
        inlayHints.enable = true;

        mappings = {
          goToDefinition = "gd";
          goToDeclaration = "gD";
          goToType = "gy";
          listImplementations = "gI";
          listReferences = "gr";
          hover = "K";
          renameSymbol = "<leader>cr";
          codeAction = "<leader>ca";
        };

        otter-nvim = {
          enable = true;
          setupOpts = {
            buffers.write_to_disk = true;
            diagnostic_update_event = [
              "BufWritePost"
              "InsertLeave"
            ];
            handle_leading_whitespace = true;
          };
        };
      };

      treesitter = {
        enable = true;
        context.enable = true;
      };
    };
  };
}
