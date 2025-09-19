{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ciscoPacketTracer8
    clang-tools
    devenv
    gcc
    nixd
    nixfmt
    rustup
    uv
  ];
}
