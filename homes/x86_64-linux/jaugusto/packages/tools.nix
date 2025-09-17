{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    dualsensectl
    gdu
    imagemagick
    poppler
    resvg
    tealdeer
    wl-clipboard
  ];
}
