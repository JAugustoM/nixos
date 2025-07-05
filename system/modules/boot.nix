{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.luks.devices."luks-6e7b194c-818a-4d22-8d36-b50cf96c95b4".device = "/dev/disk/by-uuid/6e7b194c-818a-4d22-8d36-b50cf96c95b4";
}
