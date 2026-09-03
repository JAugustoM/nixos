{ den, __findFile, ... }:
{
  den.aspects.erebus = {
    includes = [
      <boot/limine>
      <boot/plymouth>
      <networking>
      <nvidia>
    ];
    nixos =
      { pkgs, ... }:
      {
        imports = [
          ./_disk-config.nix
        ];

        hardware.facter.reportPath = ./facter.json;

        environment.systemPackages = with pkgs; [
          (ffmpeg-full.override { withUnfree = true; })
        ];

        security.sudo-rs = {
          enable = true;
          execWheelOnly = true;
        };

        services = {
          fstrim.enable = true;
          fwupd.enable = true;
          ntpd-rs.enable = true;
          power-profiles-daemon.enable = false;
          thermald.enable = true;
          upower.enable = true;

          btrfs.autoScrub = {
            enable = true;
            interval = "weekly";
            fileSystems = [ "/" ];
          };

          tlp = {
            enable = true;
            pd.enable = true;
            settings = import ./_tlp.nix;
          };
        };

        boot = {
          kernelPackages = pkgs.linuxPackages_latest;
          initrd.luks.devices.cryptroot = {
            allowDiscards = true;
            crypttabExtraOpts = [ "tpm2-device=auto " ];
            device = "/dev/disk/by-partlabel/luks";
          };
        };

        zramSwap = {
          enable = true;
          algorithm = "zstd";
          priority = 5;
          memoryPercent = 50;
        };
      };
  };
}
