{
  den.aspects.editors.zed = {
    homeManager =
      { pkgs, ... }:
      {
        programs.zed-editor = {
          enable = true;
          mutableUserSettings = false;

          userSettings = {
            code_lens = "on";
            edit_predictions = {
              disabled_globs = [ "**/*" ];
              provider = "none";
            };
            indent_guides = {
              enabled = true;
              coloring = "indent_aware";
            };
            inlay_hints.enabled = true;
            load_direnv = "shell_hook";
            telemetry = {
              diagnostics = false;
              metrics = false;
            };
            terminal.shell.program = "${pkgs.fish}/bin/fish";
          };

          extensions = [
            "catppuccin-icons"
            "codebook"
            "dart"
            "just"
            "make"
            "nix"
            "slint"
            "toml"
          ];
          extraPackages = with pkgs; [
            # C/C++
            clang-tools
            lldb
            # Codebook
            codebook
            # Dart
            dart
            # Go
            gopls
            delve
            # Just
            just-lsp
            # Markdown
            prettier
            # Nix
            nixd
            # Python
            basedpyright
            ruff
            # Rust
            rust-analyzer
            slint-lsp
            # Tools
            gnugrep
          ];
        };
      };
  };
}
