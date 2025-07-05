{
  config,
  lib,
  options,
  namespace,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  modules = {
    auto-cpufreq.enable = true;
    bluetooth.enable = true;
    desktop.enable = true;
    printing.enable = true;
    sound.enable = true;

    networking.hostName = "pluto";

    bootloader = {
      luks = "luks-6e7b194c-818a-4d22-8d36-b50cf96c95b4";
      device = "/dev/disk/by-uuid/6e7b194c-818a-4d22-8d36-b50cf96c95b4";
    };

    user = {
      user = "jaugusto";
      userName = "José Augusto";
      extraGroups = [ "networkmanager" "wheel" ];
      specialGroups = [ "plugdev" ];
    };
  };

  # Install firefox.
  programs.firefox.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/jaugusto/.config/nixos";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5";
    };
  };

  environment.systemPackages = with pkgs; [
    gcc
    git
    kdePackages.kdeconnect-kde
    python3
    rustup
    unzip
    wget
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
