{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fluent-reader
    obsidian
    pika-backup
    protonvpn-gui
    scanmem
    zapzap
  ];
}
