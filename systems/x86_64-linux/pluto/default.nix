{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./disk-config.nix
  ];

  facter.reportPath = ./facter.json;

  specialisation = {
    Cosmic.configuration = {
      environment.etc."specialisation".text = "Cosmic";
      modules.desktop.enviroment = "cosmic";
    };
  };

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  users.users.jaugusto = {
    isNormalUser = true;
    description = "José Augusto";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "docker"
      "podman"
      "libvirtd"
    ];
  };

  modules = {
    auto-cpufreq.enable = true;
    catppuccin.enable = true;
    docker.enable = true;
    flatpak.enable = true;
    gaming.enable = true;
    office.enable = true;
    plymouth.enable = true;
    podman.enable = true;
    zram.enable = true;

    boot.loader = "limine";
    boot.enableSecureBoot = true;
    boot.kernel = pkgs.linuxPackages_cachyos;

    networking.hostName = "pluto";

    nh.enable = true;
    nh.flake = "/home/jaugusto/.config/nixos";
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
  ];

  environment.systemPackages = with pkgs; [
    ffmpeg-full
  ];

  fonts.packages = with pkgs; [
    adwaita-fonts
  ];

  programs = {
    kdeconnect.enable = true;
    nix-ld.enable = true;
    partition-manager.enable = true;
  };

  services = {
    fwupd.enable = true;
    languagetool.enable = true;
    thermald.enable = true;

    flatpak.packages = [
      "app.zen_browser.zen"
      "com.stremio.Stremio"
      "com.usebottles.bottles"
      "io.github.giantpinkrobots.flatsweep"
    ];

    udev.packages = with pkgs; [
      local.openocd-udev-rules
      local.picotool-udev-rules
      local.platformio-udev-rules
    ];
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
