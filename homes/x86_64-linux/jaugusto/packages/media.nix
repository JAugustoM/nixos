{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.kasts
    kew
    stremio
    youtube-music
  ];
}
