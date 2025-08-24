{
  inputs,
  pkgs,
  ...
}:
let
  ffmpeg-full = pkgs.ffmpeg-full.override {
    withUnfree = true;
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
    libvirtd.enable = true;
    podman.enable = true;
    tlp.enable = true;

    boot.loader = "limine";
    networking.hostName = "pluto";

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

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    elisa
  ];

  environment.systemPackages = with pkgs; [
    ffmpeg-full
    gnome-boxes
    python3
  ];

  fonts.packages = with pkgs; [
    adwaita-fonts
  ];

  programs = {
    kdeconnect.enable = true;
    partition-manager.enable = true;
  };

  services.flatpak.packages = [
    "com.usebottles.bottles"
    "com.opera.Opera"
  ];

  services.languagetool.enable = true;

  services.udev.extraRules =
    with builtins;
    (concatStringsSep "\n" [
      "${readFile ./include/udev/99-picotool.rules}"
    ]);

  system.stateVersion = "25.05"; # Did you read the comment?
}
