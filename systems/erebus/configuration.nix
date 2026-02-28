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
    searx.enable = true;

    desktop.environment = "plasma";
    home-manager.user = "jaugusto";

    virtualisation.backends = [
      "podman"
    ];

    programs = {
      nh.enable = true;
      office.enable = true;

      gaming.platforms = [ "steam" ];
    };

    stylix.theme = "eldritch";
  };

  environment.systemPackages = with pkgs; [
    ffmpeg-full
    vivaldi
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
    power-profiles-daemon.enable = false;
    resolved.enable = true;
    thermald.enable = true;
    upower.enable = true;

    btrfs.autoScrub = {
      enable = true;
      interval = "weekly";
      fileSystems = [ "/" ];
    };

    flatpak.packages = [
      "com.github.johnfactotum.Foliate"
      "com.stremio.Stremio"
      "io.appflowy.AppFlowy"
      "io.github.giantpinkrobots.flatsweep"
    ];

    tlp = {
      enable = true;
      settings = import ./tlpSettings.nix;
    };

    xserver.videoDrivers = [
      "nvidia"
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
      "libvirtd"
      "podman"
    ];
  };

  networking = {
    hostName = "erebus";
    networkmanager = {
      enable = true;
      plugins = [ pkgs.networkmanager-openvpn ];
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_6_19;
    initrd.luks.devices.cryptroot = {
      device = "/dev/disk/by-partlabel/luks";
      allowDiscards = true;
    };
  };

  hardware.nvidia = {
    open = true;

    modesetting.enable = true;

    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      reverseSync.enable = true;
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
