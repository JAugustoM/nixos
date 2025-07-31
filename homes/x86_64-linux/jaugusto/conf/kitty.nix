{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
      size = 12;
    };

    settings = {
      shell = "nu";
      editor = "nvim";
    };

    keybindings = {
      # "ctrl+n" = "new_os_window_with_cwd";
      # "ctrl+enter" = "new_window_with_cwd";
    };
  };
}
