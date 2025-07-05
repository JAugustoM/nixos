{ config, pkgs, ... }:
{
  imports = [ 
    ./modules/bluetooth.nix
    ./modules/boot.nix
    ./modules/flatpak.nix
    ./modules/hardware-configuration.nix
    ./modules/localization.nix
    ./modules/networking.nix
    ./modules/programs.nix
    ./modules/services.nix
  ];

  users.users.jaugusto = {
    isNormalUser = true;
    description = "José Augusto";
    extraGroups = [ "networkmanager" "wheel" "plugdev" ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    gcc
    git
    kdePackages.kdeconnect-kde
    python3
    rustup
    unzip
    wget
  ];

  system.stateVersion = "25.05";
}
