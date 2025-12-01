{
  lib,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, pkgs, ... }:
    {
      options.modules.boot.loader = lib.mkOption {
        type = lib.types.enum [
          "limine"
          "systemd-boot"
        ];
        default = "limine";
        description = "The bootloader to use.";
      };
      config = lib.mkMerge [
        (lib.mkIf (config.modules.boot.loader == "limine") {
          boot.loader.limine = {
            enable = true;
            maxGenerations = 5;
            secureBoot.enable = true;
          };
          boot.loader.efi.canTouchEfiVariables = true;
          environment.systemPackages = with pkgs; [
            sbctl
          ];
        })
        (lib.mkIf (config.modules.boot.loader == "systemd-boot") {
          boot.loader.systemd-boot = {
            enable = true;
            configurationLimit = 5;
          };
          boot.loader.efi.canTouchEfiVariables = true;
        })
      ];
    }
  );
}
