{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ciscoPacketTracer8
    dbeaver-bin
    devenv
    gcc
    jetbrains.pycharm-community-bin
    rustup
    uv
  ];
}
