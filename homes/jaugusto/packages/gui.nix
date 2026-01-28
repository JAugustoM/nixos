{ pkgs, ... }:
{
  home.packages = with pkgs; [
    affine
    forge-mtg
    gearlever
    obsidian
    picard
    lrcget
    winboat
    zapzap
  ];
}
