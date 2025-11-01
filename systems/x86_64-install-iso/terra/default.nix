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

  console = {
    packages = with pkgs; [
      nerd-fonts.iosevka
    ];
    font = "Iosevka Nerd Font";
    keyMap = "br-abnt2";
  };

  environment.systemPackages = with pkgs; [
    git
    helix
    yazi
    # Installation Helper Scripts
    local.cleanup-sops-key
    local.setup-sops-key
  ];
}
