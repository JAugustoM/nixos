{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    kodi-wayland
    picard
    lrcget
    winboat
    zapzap
  ];
}
