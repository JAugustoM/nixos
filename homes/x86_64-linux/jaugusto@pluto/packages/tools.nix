{ pkgs, ... }:
{
  home.packages = with pkgs; [
    age
    aria2
    caligula
    dualsensectl
    gdu
    imagemagick
    nix-output-monitor
    sops
    rsgain
    tealdeer
    unrar
    wl-clipboard
  ];
}
