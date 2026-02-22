{ pkgs, ... }:
{
  home.packages = with pkgs; [
    calibre
    obsidian
    picard
    lrcget
    zapzap
  ];
}
