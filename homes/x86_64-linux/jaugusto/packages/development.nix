{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devenv
    gcc
    jetbrains.clion
    rustlings
    uv
  ];
}
