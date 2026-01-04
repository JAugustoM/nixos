{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./disk-config.nix
  ];

  facter.reportPath = ./facter.json;

  specialisation = {
    DMS.configuration = {
      environment.etc."specialisation".text = "DMS";
      modules.desktop.environment = lib.mkForce "dms";
    };
  };

  modules = {
    caddy.enable = true;
    glance.enable = true;
    sops.enable = true;

    desktop.environment = lib.mkDefault "plasma";
    home-manager.user = "jaugusto";

    virtualisation.backends = [ "podman" ];

    programs = {
      nh.enable = true;
      nvf.enable = true;
      office.enable = true;

      gaming.platforms = [ "steam" ];
    };
  };

  environment.systemPackages = with pkgs; [
    cliphist
    ffmpeg-full
    wl-clipboard
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
    fwupd.enable = true;
    resolved.enable = true;
    thermald.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = false;

    tlp.enable = true;
    tlp.settings = import ./tlpSettings.nix;

    flatpak = {
      packages = [
        "com.usebottles.bottles"
        "com.github.tchx84.Flatseal"
        "com.stremio.Stremio"
        "io.github.giantpinkrobots.flatsweep"
        "org.kde.ark"
        "org.kde.dolphin"
        "org.kde.gwenview"
        "org.kde.haruna"
        "org.kde.okular"
      ];
    };

    udev.packages = with pkgs; [
      platformio-core.udev
    ];
  };

  hardware.logitech.wireless = {
    enable = true;
    enableGraphical = true;
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
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
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

  system.stateVersion = "25.11"; # Did you read the comment?
}
