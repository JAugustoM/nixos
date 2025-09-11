{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ciscoPacketTracer8
    clang-tools
    devenv
    gcc
    rustup
    uv
  ];
}
