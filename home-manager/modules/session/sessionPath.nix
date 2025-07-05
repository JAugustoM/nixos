{ config, lib, pkgs, ... }:
{
  home.sessionPath = [
    "$HOME/.local/bin/"
    "$HOME/bin/"
    "$HOME/.bun/bin/"
    "$HOME/.cargo/bin/"
  ];
}
