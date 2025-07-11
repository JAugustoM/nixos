{
  inputs,
  system,
  pkgs,
  ...
}:
let
  nix-alien = inputs.nix-alien.packages.${system}.nix-alien;
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
in 
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];

  nix.package = pkgs.lix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  modules = {
    bluetooth.enable = true;
    desktop.enable = true;
    gaming.enable = true;
    nh.enable = true;
    printing.enable = true;
    sound.enable = true;
    zram.enable = true;

    bootloader.limineResolution = "1366x768";
    networking.hostName = "pluto";

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
  programs.nix-ld.enable = true;
  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true;

  services.languagetool.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = ["/"];
  };

  environment.systemPackages = with pkgs; [
    gcc
    git
    python3
    rustup
    unzip
    wget
    nix-alien
    fenix
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
