{
  inputs,
  pkgs,
  ...
}:
let
  ffmpeg-full = pkgs.ffmpeg-full.override {
    withUnfree = true;
  };
  flakePath = "/home/jaugusto/.config/nixos";
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
    bluetooth.enable = true;
    catppuccin.enable = true;
    desktop.enable = true;
    gaming.enable = true;
    libvirtd.enable = true;
    podman.enable = true;
    printing.enable = true;
    sound.enable = true;
    tlp.enable = true;
    zram.enable = true;

    networking.hostName = "pluto";

    boot = {
      enableSecureBoot = false;
      loader = "limine";
    };

    nh = {
      enable = true;
      inherit flakePath;
    };

    storage = {
      enableFstrim = true;
      enableAutoScrub = true;
    };

    flatpak = {
      enable = true;
      packages = [
        "com.usebottles.bottles"
        "com.opera.Opera"
      ];
    };

    udev = {
      enable = true;
      extraRules = with builtins; [
        "${readFile ./include/udev/99-picotool.rules}"
      ];
    };

    user = {
      user = "jaugusto";
      userName = "José Augusto";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
      ];
      specialGroups = [ "plugdev" ];
    };
  };

  programs = {
    kdeconnect.enable = true;
    partition-manager.enable = true;
  };

  services.languagetool.enable = true;

  environment.systemPackages = with pkgs; [
    ffmpeg-full
    gnome-boxes
    python3
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    elisa
  ];

  fonts.packages = with pkgs; [
    adwaita-fonts
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
