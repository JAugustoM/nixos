{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nexusmods-app-unfree
    obsidian
    picard
    lrcget
    veracrypt
    zapzap
  ];
}
