{ config, lib, pkgs, ... }:
{
  programs.plasma = {
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Breeze Dark";
      wallpaper = ../include/media/City.jpg;
    };
  };
}
