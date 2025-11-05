{
  pkgs,
  lib,
  config,
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
    elisa
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
    zsh.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  services = {
    fwupd.enable = true;
    languagetool.enable = true;
    thermald.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
    };

    flatpak.packages = [
      "com.usebottles.bottles"
      "com.github.tchx84.Flatseal"
      "io.github.giantpinkrobots.flatsweep"
      "io.github.zaedus.spider"
      "com.gitlab.newsflash"
      "com.stremio.Stremio"
      "app.zen_browser.zen"
    ];

    udev.packages = with pkgs; [
      platformio-core.udev
    ];
  };

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  users.defaultUserShell = pkgs.zsh;
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

  networking = {
    hostName = "pluto";
    networkmanager.enable = true;
  };

  fileSystems."/data" = {
    device = "/dev/disk/by-label/Data";
    fsType = "btrfs";
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
