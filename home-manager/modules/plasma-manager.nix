{ config, lib, pkgs, ... }:
{
  programs.plasma = {
    enable = true;
    fonts = import ./plasma-manager/fonts.nix;
    hotkeys = import ./plasma-manager/hotkeys.nix;
    workspace = import ./plasma-manager/workspace.nix;
  };
}
