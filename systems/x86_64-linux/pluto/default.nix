{
  inputs,
  system,
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
  nix-alien = inputs.nix-alien.packages.${system}.nix-alien;
in 
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  

  modules = {
    bluetooth.enable = true;
    cachix.enable = true;
    catppuccin.enable = true;
    desktop.enable = true;
    gaming.enable = true;
    podman.enable = true;
    printing.enable = true;
    sound.enable = true;
    zram.enable = true;

    networking.hostName = "pluto";

    nh = {
      enable = true;
      inherit flakePath;
    };

    flatpak = {
      enable = true;
      packages = [
        "io.github.brunofin.Cohesion"
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
      extraGroups = [ "networkmanager" "wheel" ];
      specialGroups = [ "plugdev" ];
    };
  };

  programs.firefox.enable = true;
  programs.kdeconnect.enable = true;
  programs.nix-ld.enable = true;
  programs.partition-manager.enable = true;

  services.languagetool.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = ["/"];
  };

  environment.systemPackages = with pkgs; [
    fenix
    ffmpeg-full
    gcc
    git
    nix-alien
    python3
    rustup
    unzip
    wget
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    elisa
    kate
    konsole
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
