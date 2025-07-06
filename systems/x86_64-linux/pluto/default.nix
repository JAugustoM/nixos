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
    amd-gpu.enable = true;
    auto-cpufreq.enable = true;
    bluetooth.enable = true;
    desktop.enable = true;
    nh.enable = true;
    printing.enable = true;
    sound.enable = true;
    steam.enable = true;

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

    user = {
      user = "jaugusto";
      userName = "José Augusto";
      extraGroups = [ "networkmanager" "wheel" ];
      specialGroups = [ "plugdev" ];
    };
  };

  programs.firefox.enable = true;
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    git
    kdePackages.kdeconnect-kde
    python3
    rustup
    unzip
    wget
    inputs.nix-alien.packages.${system}.nix-alien
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
