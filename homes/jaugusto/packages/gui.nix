{ pkgs, ... }:
{
  home.packages = with pkgs; [
    appflowy
    gearlever
    obsidian
    picard
    lrcget
    zapzap
  ];
}
