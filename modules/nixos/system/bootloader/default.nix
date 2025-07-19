{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "bootloader";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      linuxVersion = lib.mkOption {
        description = "Linux Kernel version to use";
        type = types.str;
        default = "latest";
      };
    };
  };

  config = {
    boot = {
      initrd.luks.devices = {
        cryptroot = {
          device = "/dev/disk/by-partlabel/luks";
          allowDiscards = true;
        };
      };

      tmp = {
        useTmpfs = true;
        tmpfsSize = "50%";
      };

      loader = {
        limine = {
          style.wallpapers = [ ./include/nix-wallpaper-nineish-catppuccin-mocha.png ];
          enable = true;
          maxGenerations = 5;
        };
        efi.canTouchEfiVariables = true;
      };

      kernelPackages = pkgs."linuxPackages_${cfg.linuxVersion}";
    };
  };
}
