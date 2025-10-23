{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
  ];

  networking.networkmanager.enable = lib.mkForce false;
  networking.wireless.enable = true;

  snowfallorg.users.jaugusto = {
    create = false;
    home.enable = false;
  };
}
