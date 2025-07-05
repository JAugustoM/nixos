{ config, lib, pkgs, ... }:
{
  home.username = "jaugusto";
  home.homeDirectory = "/home/jaugusto";
  home.stateVersion = "25.05"; 

  imports = [
    ./modules/programs.nix
    ./modules/session.nix
    ./modules/catppuccin.nix
    ./modules/plasma-manager.nix
  ];
}
