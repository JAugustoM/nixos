{ ... }:
{
  programs.zellij = {
    enable = true;

    settings = {
      default_shell = "nu";
      pane_frames = false;
      copy_command = "wl-copy";
      show_startup_tips = false;
    };
  };
}
