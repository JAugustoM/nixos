{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devenv
    gcc
    rustup
    uv
  ];
}
