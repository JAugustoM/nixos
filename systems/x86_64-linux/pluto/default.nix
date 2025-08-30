{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  ffmpeg-full = pkgs.ffmpeg-full.override {
    withUnfree = true;
  };
  vivaldi = pkgs.vivaldi.override {
    proprietaryCodecs = true;
    enableWidevine = true;
  };
in
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
  };

  modules = {
    catppuccin.enable = true;
    gaming.enable = true;
    nix-ld.enable = true;
    podman.enable = true;
    tlp.enable = true;

    boot.loader = "limine";
    networking.hostName = "pluto";
    nh.flake = "/home/jaugusto/.config/nixos";

    user = {
      user = "jaugusto";
      userName = "José Augusto";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "podman"
      ];
      specialGroups = [
        "plugdev"
      ];
    };
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    elisa
  ];

  environment.systemPackages = [
    ffmpeg-full
    vivaldi
  ];

  fonts.packages = with pkgs; [
    adwaita-fonts
  ];

  programs = {
    kdeconnect.enable = true;
    partition-manager.enable = true;
  };

  services = {
    languagetool.enable = true;

    flatpak.packages = [
      "com.usebottles.bottles"
      "com.stremio.Stremio"
    ];

    udev.extraRules = lib.nixos.concatUdevRules [
      ./include/udev/99-picotool.rules
    ];
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
