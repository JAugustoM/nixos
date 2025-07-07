{
  config,
  lib,
  options,
  namespace,
  inputs,
  system,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  modules = {
    bluetooth.enable = true;
    desktop.enable = true;
    gaming.enable = true;
    nh.enable = true;
    printing.enable = true;
    sound.enable = true;

    networking.hostName = "pluto";

    bootloader = {
      luks = "luks-6e7b194c-818a-4d22-8d36-b50cf96c95b4";
      device = "/dev/disk/by-uuid/6e7b194c-818a-4d22-8d36-b50cf96c95b4";
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
  programs.nix-ld.enable = true;
  programs.kdeconnect.enable = true;

  services.languagetool.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    git
    python3
    rustup
    unzip
    wget
    inputs.nix-alien.packages.${system}.nix-alien
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
