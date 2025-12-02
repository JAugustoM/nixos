{ inputs, moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ pkgs, ... }:
    {
      programs.helix = {
        enable = true;
        defaultEditor = true;

        extraPackages = with pkgs; [
          bash-language-server
          shellcheck
          shfmt
          clang-tools
          neocmakelsp
          fish-lsp
          just-lsp
          ltex-ls-plus
          markdown-oxide
          nixd
          nixfmt
          python313Packages.python-lsp-server
          ruff
          systemd-lsp
          taplo
          biome
          typescript-language-server
          yaml-language-server
        ];

        languages = {
          language-server = {
            clangd.args = [
              (
                "--query-driver="
                + "/nix/store/*gcc-arm-embedded*/bin/arm-none-eabi-gcc,"
                + "/nix/store/*gcc-arm-embedded*/bin/arm-none-eabi-g++"
              )
            ];

            ltex-ls-plus.config.ltex = {
              language = "pt-BR";
              languageToolHttpServerUri = "http://localhost:8081/v2/";
              completionEnabled = true;
            };

            nixd.config.options = {
              nixos.expr = "(builtins.getFlake (builtins.toString ${inputs.self})).nixosConfigurations.pluto.options";
              home-manager = "(builtins.getFlake (builtins.toString ${inputs.self})).homeConfigurations.jaugusto.options";
            };

            rust-analyzer.config = {
              cargo.features = "all";
              check.command = "clippy";
            };
          };
          language = [
            {
              name = "markdown";
              language-servers = [
                "markdown-oxide"
                "ltex-ls-plus"
              ];
            }
          ];
        };

        settings = {
          editor = {
            bufferline = "multiple";
            clipboard-provider = "wayland";
            cursorline = true;
            end-of-line-diagnostics = "hint";
            line-number = "relative";
            rulers = [ 120 ];
            shell = [
              "fish"
              "-c"
            ];
            true-color = true;

            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "underline";
            };

            lsp = {
              display-inlay-hints = true;
              display-messages = true;
            };

            indent-guides = {
              render = true;
            };

            inline-diagnostics = {
              cursor-line = "warning";
            };
          };

          keys.normal = {
            X = "select_line_above";
            A-q = ":write-quit-all";
          };

          keys.select = {
            X = "select_line_above";
          };
        };
      };
    }
  );
}
