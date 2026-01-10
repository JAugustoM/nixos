{
  pkgs,
  ...
}:
{
  imports = [
    ./disk-config.nix
  ];

  facter.reportPath = ./facter.json;

  modules = {
    caddy.enable = true;
    glance.enable = true;
    niri.enable = true;
    sops.enable = true;

    desktop.environment = "plasma";
    home-manager.user = "jaugusto";

    virtualisation.backends = [ "podman" ];

    programs = {
      nh.enable = true;
      nvf.enable = true;
      office.enable = true;

      gaming.platforms = [ "steam" ];
    };

    stylix.theme = "ayu-dark";
  };

  environment.systemPackages = with pkgs; [
    ffmpeg-full
  ];

  programs = {
    kdeconnect.enable = true;
    nix-ld.enable = true;
    partition-manager.enable = true;
    zsh.enable = true;

    nh.flake = "/home/jaugusto/.config/nixos";
  };

  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
  };

  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    resolved.enable = true;
    thermald.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = false;

    tlp.enable = true;
    tlp.settings = import ./tlpSettings.nix;

    btrfs.autoScrub = {
      enable = true;
      interval = "weekly";
      fileSystems = [ "/" ];
    };

    flatpak = {
      packages = [
        "com.usebottles.bottles"
        "com.github.tchx84.Flatseal"
        "com.stremio.Stremio"
        "io.github.giantpinkrobots.flatsweep"
      ];
    };

    udev.packages = with pkgs; [
      platformio-core.udev
    ];
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.jaugusto = {
    isNormalUser = true;
    description = "José Augusto";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "podman"
    ];
  };

  networking = {
    hostName = "pluto";
    networkmanager = {
      enable = true;
    };
  };

  boot.initrd.luks.devices = {
    cryptroot = {
      device = "/dev/disk/by-partlabel/luks";
      allowDiscards = true;
    };
  };

  fileSystems."/data" = {
    device = "/dev/disk/by-label/Data";
    fsType = "btrfs";
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 5;
    memoryPercent = 50;
  };

  system.stateVersion = "25.11"; # Did you read the comment?
}
