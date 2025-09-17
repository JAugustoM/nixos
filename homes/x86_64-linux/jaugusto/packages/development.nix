{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ciscoPacketTracer8
    clang-tools
    devenv
    nixd
    nixfmt
    rustup
    uv
  ];
}
