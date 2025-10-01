{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    caligula
    dualsensectl
    gdu
    imagemagick
    poppler
    resvg
    tealdeer
    wl-clipboard
  ];
}
