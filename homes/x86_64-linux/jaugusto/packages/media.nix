{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kew
    stremio
  ];
}
