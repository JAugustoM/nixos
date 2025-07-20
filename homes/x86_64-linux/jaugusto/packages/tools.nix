{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    dualsensectl
    gdu
    imagemagick
    keyfinder-cli
    ocrmypdf
    pika-backup
    poppler
    resvg
    tealdeer
    wl-clipboard
  ];
}
