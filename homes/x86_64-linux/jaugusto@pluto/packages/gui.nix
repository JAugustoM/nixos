{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    picard
    pika-backup
    protonvpn-gui
    quodlibet-full
    lrcget
    scanmem
    veracrypt
    zapzap
  ];
}
