{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    caligula
    dualsensectl
    gdu
    imagemagick
    nix-output-monitor
    rsgain
    tealdeer
    unrar
    wl-clipboard
  ];
}
