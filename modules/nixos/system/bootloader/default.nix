{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "boot";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      kernel = lib.mkOption {
        description = "Linux Kernel version to use";
        default = pkgs.linuxPackages_latest;
      };
      loader = lib.mkOption {
        description = "Loader to use";
        default = "systemd-boot";
        type = types.enum [
          "systemd-boot"
          "limine"
        ];
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

      loader =
        if cfg.loader == "limine" then
          {
            limine = {
              style.wallpapers = [ ./include/nix-wallpaper-nineish-catppuccin-mocha.png ];
              enable = true;
              maxGenerations = 5;
            };
            efi.canTouchEfiVariables = true;
          }
        else
          {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
          };

      kernelPackages = cfg.kernel;
    };
  };
}
