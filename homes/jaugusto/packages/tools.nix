{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    caligula
    dualsensectl
    gdu
    git-credential-manager
    imagemagick
    kew
    nix-output-monitor
    rsgain
    tealdeer
    unrar
  ];
}
