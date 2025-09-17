{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    pika-backup
    protonvpn-gui
    scanmem
    zapzap
  ];
}
