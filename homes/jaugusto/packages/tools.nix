{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    caligula
    cliphist
    dualsensectl
    gdu
    git-credential-manager
    imagemagick
    kew
    libgourou
    nix-output-monitor
    nurl
    rsgain
    tealdeer
    unrar
    wl-clipboard
  ];
}
