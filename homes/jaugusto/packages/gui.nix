{ pkgs, ... }:
{
  home.packages = with pkgs; [
    affine
    obsidian
    picard
    lrcget
    zapzap
  ];
}
