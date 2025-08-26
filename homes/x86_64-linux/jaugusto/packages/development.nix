{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bison
    devenv
    flex
    gcc
    jetbrains.clion
    jre
    rustup
    uv
  ];
}
