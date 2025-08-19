{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devenv
    jetbrains.clion
    rustlings
    uv
  ];
}
