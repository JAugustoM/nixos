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
          style.graphicalTerminal = {
            palette = "1e1e2e;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
            brightPalette = "585b70;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
            background = "1e1e2e";
            foreground = "cdd6f4";
            brightBackground = "585b70";
            brightForeground = "cdd6f4";
          };
          enable = true;
          maxGenerations = 5;
        };
        efi.canTouchEfiVariables = true;
      };

      kernelPackages = pkgs."linuxPackages_${cfg.linuxVersion}";
    };
  };
}
