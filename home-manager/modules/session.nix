{ config, lib, pkgs, ... }:
{
  imports = [
    ./session/sessionPath.nix
    ./session/sessionVariables.nix
    ./session/desktopEntries.nix
  ];
}
