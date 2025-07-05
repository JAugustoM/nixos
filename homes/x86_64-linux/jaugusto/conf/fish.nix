{ config, lib, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    functions = import ../include/fish/functions.nix;
    shellAbbrs = import ../include/fish/shellAbbrs.nix;
  };
}
