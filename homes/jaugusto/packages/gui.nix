{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    picard
    lrcget
    zapzap
  ];
}
