{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    picard
    pika-backup
    quodlibet-full
    lrcget
    veracrypt
    zapzap
  ];
}
