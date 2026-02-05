{ pkgs, ... }:
{
  home.packages = with pkgs; [
    anytype
    obsidian
    picard
    lrcget
    winboat
    zapzap
  ];
}
