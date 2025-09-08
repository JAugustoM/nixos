{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    dualsensectl
    gdu
    imagemagick
    img2pdf
    ocrmypdf
    poppler
    resvg
    tealdeer
    unrar
    wl-clipboard
  ];
}
