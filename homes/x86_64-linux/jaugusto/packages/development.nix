{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ciscoPacketTracer8
    dbeaver-bin
    devenv
    gcc
    rustup
    uv
  ];
}
