{ config, lib, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
      size = 12;
    };
    settings = {
      shell = "fish";
      editor = "nvim";
    };
  };
}
