{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devenv
    rustlings
    uv
  ];
}
