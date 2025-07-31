{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    devenv
    nodejs
    rustlings
    scrcpy
    typescript
    uv
  ];
}

