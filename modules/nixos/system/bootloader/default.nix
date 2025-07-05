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

      luks = lib.mkOption {
        description = "";
        type = types.str;
        default = "";
      };

      device = lib.mkOption {
        description = "";
        type = types.str;
        default = "";
      };
    };
  };

  config = {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      kernelPackages = pkgs."linuxPackages_${cfg.linuxVersion}";
      initrd.luks.devices.${cfg.luks}.device = cfg.device;
    };
  };
}
