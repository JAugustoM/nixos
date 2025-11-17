{ pkgs, ... }:
{
  home.packages = with pkgs; [
    act
    devenv
    gcc
    rustup
    uv
  ];
}
