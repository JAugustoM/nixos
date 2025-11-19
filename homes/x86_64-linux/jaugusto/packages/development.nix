{ pkgs, ... }:
{
  home.packages = with pkgs; [
    act
    ciscoPacketTracer8
    devenv
    gcc
    rustup
    uv
  ];
}
