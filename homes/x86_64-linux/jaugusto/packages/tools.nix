{ pkgs, ... }:
{
  home.packages = with pkgs; [
    affine
    aria2
    dualsensectl
    gdu
    imagemagick
    img2pdf
    ocrmypdf
    pika-backup
    poppler
    resvg
    tealdeer
    unrar
    wl-clipboard
  ];
}
