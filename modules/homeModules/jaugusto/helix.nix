{
  lib,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, pkgs, ... }:
    let
      cfg = config.modules.helix;
    in
    {
      options.modules.helix.enable = lib.mkEnableOption "Enable helix";

      config = lib.mkIf (cfg.enable) {
        programs.helix = {
          enable = true;
          defaultEditor = true;

          extraPackages = with pkgs; [
            codebook

            # C/C++
            clang-tools
            neocmakelsp

            # Just
            just-lsp

            # Markdown
            marksman

            # Nix
            nixd
            nixfmt

            # Python
            ruff
            ty

            # Rust
            rust-analyzer
            taplo

            # YAML
            yaml-language-server
          ];

          languages = {
            language-server = {
              codebook = {
                command = "codebook-lsp";
                args = [ "serve" ];
              };
            };

            language = [
              {
                name = "markdown";
                language-servers = [ "marksman" "codebook" ];
              }
              {
                name = "rust";
                language-servers = [ "rust-analyzer" "codebook" ];
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
                character = "┆";
                skip-levels = 1;
              };

              inline-diagnostics = {
                cursor-line = "warning";
              };
            };

            keys.normal = {
              X = "select_line_above";
              D = "@xd";
              A-q = ":write-quit-all";
            };

            keys.select = {
              X = "select_line_above";
            };
          };
        };
      };
    }
  );
}
