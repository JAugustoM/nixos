{
  inputs,
  pkgs,
  ...
}:
let
  fenix = pkgs.fenix.stable.withComponents [
    "rustc"
    "cargo"
    "rustfmt"
    "rust-std"
    "rust-docs"
    "rust-analyzer"
    "clippy"
    "rust-src"
  ];
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
    firefox.enable = true;
    gaming.enable = true;
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
        "io.github.brunofin.Cohesion"
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
    zsh.enable = true;
  };

  services.languagetool.enable = true;

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    fenix
    ffmpeg-full
    python3
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    elisa
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    adwaita-fonts
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
