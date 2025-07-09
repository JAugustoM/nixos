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
      loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 5;
        };
        efi.canTouchEfiVariables = true;
      };

      kernelPackages = pkgs."linuxPackages_${cfg.linuxVersion}";
    };
  };
}
