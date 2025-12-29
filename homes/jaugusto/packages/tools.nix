{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    caligula
    dualsensectl
    gdu
    imagemagick
    kew
    nix-output-monitor
    rsgain
    tealdeer
    unrar
  ];
}
