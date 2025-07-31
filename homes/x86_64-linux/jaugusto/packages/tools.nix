{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    dualsensectl
    gdu
    imagemagick
    lldb
    ocrmypdf
    pika-backup
    poppler
    proton-pass
    resvg
    tealdeer
    unrar
    wl-clipboard
  ];
}
