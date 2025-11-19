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

  nixpkgs.config.permittedInsecurePackages = [
    "ciscoPacketTracer8-8.2.2"
  ];

  environment.systemPackages = with pkgs; [
    (ffmpeg-full.override { withUnfree = true; })
  ];

  fonts.packages = with pkgs; [
    adwaita-fonts
  ];

  programs = {
    kdeconnect.enable = true;
    nh.flake = "/home/jaugusto/.config/nixos";
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
      "com.gitlab.newsflash"
      "org.gnome.World.PikaBackup"
      "io.github.zaedus.spider"
      "com.stremio.Stremio"
      "app.zen_browser.zen"
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
      "libvirtd"
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

  system.stateVersion = "25.05"; # Did you read the comment?
}
