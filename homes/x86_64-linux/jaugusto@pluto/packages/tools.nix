{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    bitwarden-cli
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
