{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    picard
    quodlibet-full
    lrcget
    veracrypt
    zapzap
  ];
}
