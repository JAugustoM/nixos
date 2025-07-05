{ config, lib, pkgs, ... }:
{
  programs.plasma = {
    enable = true;
    workspace = import ./plasma-manager/workspace.nix;
  };
}
