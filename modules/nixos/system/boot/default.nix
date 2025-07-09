{
  config,
  lib,
  pkgs,
  virtual,
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

  config = lib.mkIf (!virtual) {
    boot = {
      initrd = {
        luks.devices = lib.mkDefault {
          cryptroot = {
            device = "/dev/disk/by-partlabel/luks";
            allowDiscards = true;
          };
        };

        systemd.enable = lib.mkDefault true;
      };

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
