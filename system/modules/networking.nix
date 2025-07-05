{ config, pkgs, ... }:
{
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  networking.firewall.allowedUDPPortRanges = [
    { from = 1714; to = 1764; }
  ];

  networking.firewall.allowedTCPPortRanges = [
    { from = 1714; to = 1764; }
  ];
}
