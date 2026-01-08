{ pkgs, ... }:
{
  home.packages = with pkgs; [
    affine
    gearlever
    obsidian
    picard
    lrcget
    zapzap
  ];
}
