let
  mntOptions = vol: [
    "subvol=${vol}"
    "compress=zstd"
    "noatime"
  ];
  mkSubVol = mnt: vol: {
    mountpoint = mnt;
    mountOptions = mntOptions vol;
  };
in
{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-XPG_GAMMIX_S70_BLADE_2O5129ANG8UP";
        content = {
          type = "gpt";

          partitions.ESP = {
            label = "boot";
            name = "ESP";
            size = "2G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "defaults" ];
            };
          };

          partitions.luks = {
            label = "luks";
            size = "100%";
            content = {
              type = "luks";
              name = "cryptroot";
              content = {
                type = "btrfs";
                extraArgs = [
                  "-L"
                  "nixos"
                  "-f"
                ];

                subvolumes = {
                  "/root" = mkSubVol "/" "root";
                  "/home" = mkSubVol "/home" "home";
                  "/nix" = mkSubVol "/nix" "nix";
                };
              };
            };
          };
        };
      };
    };
  };
}
