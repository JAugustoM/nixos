{
  pkgs,
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
      modules.desktop.manager = "cosmic";
    };
  };

  modules = {
    glance.enable = true;
  };

  environment.systemPackages = with pkgs; [
    ffmpeg-full
  ];

  programs = {
    firefox.enable = true;
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
    languagetool.enable = true;
    thermald.enable = true;

    flatpak.packages = [
      "com.usebottles.bottles"
      "com.github.tchx84.Flatseal"
      "io.github.giantpinkrobots.flatsweep"
      "io.github.zaedus.spider"
      "com.stremio.Stremio"
    ];

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
      "docker"
      "podman"
    ];
  };

  networking = {
    hostName = "pluto";
    networkmanager.enable = true;
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
