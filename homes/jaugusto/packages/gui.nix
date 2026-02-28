{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bottles
    obsidian
    picard
    lrcget
    zapzap
  ];
}
