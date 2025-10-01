{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];

  specialisation = {
    Cosmic.configuration = {
      modules.desktop.enviroment = "cosmic";
    };
  };

  home-manager.backupFileExtension = "bak";

  modules = {
    catppuccin.enable = true;
    docker.enable = true;
    flatpak.enable = true;
    gaming.enable = true;
    office.enable = true;
    plymouth.enable = true;
    podman.enable = true;
    tlp.enable = true;
    tlp.settings = import ./include/tlpSettings.nix;

    boot.kernel = pkgs.linuxPackages_cachyos;
    boot.loader = "limine";
    networking.hostName = "pluto";

    nh.enable = true;
    nh.flake = "/home/jaugusto/.config/nixos";

    user = {
      user = "jaugusto";
      userName = "José Augusto";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "podman"
        "libvirtd"
      ];
      specialGroups = [
        "plugdev"
      ];
    };
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
  ];

  environment.systemPackages = with pkgs; [
    (ffmpeg-full.override { withUnfree = true; })
  ];

  fonts.packages = with pkgs; [
    adwaita-fonts
  ];

  programs.kdeconnect.enable = true;
  programs.nix-ld.enable = true;
  programs.partition-manager.enable = true;

  services = {
    languagetool.enable = true;

    flatpak.packages = [
      "app.zen_browser.zen"
      "com.stremio.Stremio"
      "io.github.giantpinkrobots.flatsweep"
    ];

    udev.extraRules = lib.nixos.concatUdevRules [
      ./include/udev/99-picotool.rules
    ];
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
