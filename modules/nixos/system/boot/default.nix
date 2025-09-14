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
      enableSecureBoot = lib.mkEnableOption "Enable Secure Boot";
    };
  };

  config = {
    boot = {
      initrd.luks.devices = lib.mkDefault {
        cryptroot = {
          device = "/dev/disk/by-partlabel/luks";
          allowDiscards = true;
        };
      };

      consoleLogLevel = 3;
      initrd.verbose = false;
      initrd.systemd.enable = true;
      kernelParams = [
        "quiet"
        "splash"
        "intremap=on"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
      ];

      plymouth.enable = true;

      tmp = lib.mkDefault {
        useTmpfs = true;
        tmpfsSize = "50%";
      };

      loader = lib.mkMerge [
        (lib.mkIf (cfg.loader == "systemd-boot") {
          systemd-boot = {
            enable = true;
            configurationLimit = lib.mkDefault 5;
          };
        })
        (lib.mkIf (cfg.loader == "limine") {
          limine = {
            enable = true;
            maxGenerations = lib.mkDefault 5;
            secureBoot.enable = cfg.enableSecureBoot;
          };
        })
        {
          efi.canTouchEfiVariables = true;
        }
      ];

      kernelPackages = cfg.kernel;
    };

    environment.systemPackages = lib.mkIf (cfg.loader == "limine") [
      pkgs.sbctl
    ];
  };
}
