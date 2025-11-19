{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ente-auth
    obsidian
    picard
    pika-backup
    quodlibet-full
    lrcget
    veracrypt
    zapzap
  ];
}
