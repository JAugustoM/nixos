{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    caligula
    dualsensectl
    gdu
    imagemagick
    mosquitto
    putty
    tealdeer
    wl-clipboard
  ];
}
