{ pkgs, ... }:
{
  home.packages = with pkgs; [
    act
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
