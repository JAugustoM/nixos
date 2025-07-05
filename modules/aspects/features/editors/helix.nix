{ inputs, ... }:
{
  flake-file.inputs = {
    helix-git.url = "github:helix-editor/helix";
  };

  den.aspects.editors.helix = {
    nixos = {
      nixpkgs.overlays = [ inputs.helix-git.overlays.default ];
    };
    homeManager = { pkgs, ... }: {
      home = {
        packages = with pkgs; [
          steel
        ];

        sessionVariables = {
          STEEL_HOME = "$HOME/.local/share/steel";
        };
      };

      programs.helix = {
        enable = true;

        extraPackages = with pkgs; [
          #  C/C++
          clang-tools

          #  CMake
          neocmakelsp

          #  Dart
          dart

          #  Json
          vscode-json-languageserver

          # Just
          just-lsp

          #  Markdown
          codebook
          markdown-oxide
          rumdl

          # 󱄅 Nix
          nixd
          nixfmt

          #  Python
          pyrefly
          ruff

          #  Rust
          rust-analyzer

          # Slint
          slint-lsp

          # Toml
          taplo
          tombi

          #  Yaml
          yaml-language-server
          yamlfmt
        ];

        settings = fromTOML ''
          [editor]
          cursor-shape = { insert = "bar", normal = "block", select = "underline" }
          line-number = "relative"
          bufferline = "multiple"
          color-modes = true
          end-of-line-diagnostics = "hint"
          rainbow-brackets = true

          [editor.statusline]
          left = ["mode", "spacer", "version-control", "read-only-indicator", "file-modification-indicator"]
          center = ["file-name"]
          right = ["spinner", "diagnostics", "selections", "position", "position-percentage"]

          [editor.lsp]
          display-inlay-hints = true

          [editor.auto-pairs]
          '(' = ')'
          '{' = '}'
          '[' = ']'
          '"' = '"'
          "'" = "'"
          '`' = '`'
          '<' = '>'

          [editor.indent-guides]
          render = true
          character = "╎"

          [editor.inline-diagnostics]
          cursor-line = "warning"

          [keys.normal]
          "A-w" = ":buffer-close"
          "H" = "@gp"
          "L" = "@gn"

          "C-h" = "@<C-w>h"
          "C-j" = "@<C-w>j"
          "C-k" = "@<C-w>k"
          "C-l" = "@<C-w>l"

          "A-x" = "extend_to_line_bounds"
          "A-q" = ":write-quit-all"

          "D" = "@xdgs"
          "Y" = "@xy"

          "X" = "select_line_above"

          [keys.select]
          "A-x" = "extend_to_line_bounds"
          "X" = "select_line_above"
        '';

        languages = fromTOML ''
          [language-server.codebook]
          command = "codebook-lsp"
          args = ["serve"]

          [[language]]
          name = "c"
          auto-format = true              

          [[language]]
          name = "cpp"
          auto-format = true              

          [[language]]
          name = "c"
          auto-format = true              

          [[language]]
          name = "cmake"
          auto-format = true

          [[language]]
          name = "dart"
          auto-format = true              

          [[language]]
          name = "markdown"
          language-servers = ["markdown-oxide", "rumdl", "codebook"]
          formatter = { command = "rumdl", args = ["check", "--fix", "--stdin"] }
          auto-format = true              

          [[language]]
          name = "nix"
          auto-format = true              

          [[language]]
          name = "python"
          language-servers = ["pyrefly", "ruff"]
          auto-format = true              

          [[language]]
          name = "rust"
          auto-format = true              

          [[language]]
          name = "slint"
          auto-format = true              

          [[language]]
          name = "toml"
          auto-format = true              

          [[language]]
          name = "yaml"
          auto-format = true              
        '';
      };
    };
  };
}
