{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extraPackages = with pkgs; [
      clang-tools
      lldb
      nil
      nixd
      ruff
    ];
    userSettings = {
      buffer_font_family = "Iosevka Nerd Font";
      dap = {
        CodeLLDB.binary = "lldb-dap";
      };
      diagnostics.inline.enabled = true;
      disable_ai = true;
      inlay_hints.enabled = true;
      languages = {
        Python.language_servers = [ "ruff" ];
      };
      load_direnv = "shell_hook";
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      terminal = {
        copy_on_select = true;
        font_family = "Iosevka Nerd Font";
      };
    };
    extensions = [
      "nix"
      "ruff"
    ];
  };
}
