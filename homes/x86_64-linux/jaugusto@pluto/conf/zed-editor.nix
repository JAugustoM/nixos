{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "codebook"
      "git_firefly"
      "neocmake"
      "markdown-oxide"
      "nix"
      "tombi"
      "toml"
      "xml"
    ];

    extraPackages = with pkgs; [
      basedpyright
      clang-tools
      lldb
      neocmakelsp
      nil
      nixd
      ruff
      rust-analyzer
      yaml-language-server
    ];

    userSettings = {
      auto_signature_help = true;
      close_on_file_delete = true;
      load_direnv = "shell_hook";
      inlay_hints.enabled = true;

      features = {
        edit_prediction_provider = "none";
      };

      lsp = {
        clangd = {
          arguments = [
            "-background-index"
            "-compile-commands-dir=build"
          ];
        };
      };

      languages = {
        C = {
          format_on_save = "on";
          tab_size = 2;
        };
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      terminal = {
        shell.program = "fish";
        detect_venv.on.activate_script = "fish";
      };
    };
  };

  xdg.configFile."codebook" = {
    enable = true;
    target = "codebook/codebook.toml";
    text = ''
      dictionaries = ["en_us", "pt_br"]
    '';
  };
}
