{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    settings = {
      editor = "hx";
      shell = "fish";

      enabled_layouts = "splits,stack";
      notify_on_cmd_finish = "invisible";
    };

    keybindings = {
      "ctrl+n" = "launch --location=vsplit --cwd=current";
      "ctrl+m" = "launch --location=hsplit --cwd=current";
      "ctrl+e" = "launch --type=overlay --cwd=current hx .";
      "ctrl+g" = "launch --type=overlay --cwd=current gitui";
      "ctrl+f" = "toggle_layout stack";

      "alt+h" = "neighboring_window left";
      "alt+l" = "neighboring_window right";
      "alt+j" = "neighboring_window down";
      "alt+k" = "neighboring_window up";
    };
  };
}
