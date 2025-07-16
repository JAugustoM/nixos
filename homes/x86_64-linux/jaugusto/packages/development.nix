{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    deadnix
    nixd
    nodejs
    rustlings
    scrcpy
    statix
    uv
  ];
}

