{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    deadnix
    devenv
    lldb
    nixd
    nodejs
    rustlings
    scrcpy
    statix
    uv
  ];
}

