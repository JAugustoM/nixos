{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    deadnix
    devenv
    nixd
    nodejs
    rustlings
    scrcpy
    statix
    uv
  ];
}

