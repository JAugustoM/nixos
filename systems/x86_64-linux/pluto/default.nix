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
    catppuccin.enable = true;
    docker.enable = true;
    flatpak.enable = true;
    gaming.enable = true;
    office.enable = true;
    plymouth.enable = true;
    podman.enable = true;
    tlp.enable = true;
    tlp.settings = import ./include/tlpSettings.nix;

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
    toybox
  ];

  fonts.packages = with pkgs; [
    adwaita-fonts
  ];

  programs.kdeconnect.enable = true;
  programs.nix-ld.enable = true;
  programs.partition-manager.enable = true;

  services = {
    fwupd.enable = true;
    languagetool.enable = true;

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

  boot.loader.limine.extraEntries = ''
    /Windows
      protocol: efi
      path: uuid(ade8f4cb-b193-4a2b-8d17-12c28aac1034):/EFI/Microsoft/Boot/bootmgfw.efi
  '';

  system.stateVersion = "25.05"; # Did you read the comment?
}
