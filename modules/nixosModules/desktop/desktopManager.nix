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
      options.modules.desktop.manager = lib.mkOption {
        type = lib.types.enum [
          "cosmic"
          "plasma"
        ];
        default = "plasma";
        description = "The desktop manager to use.";
      };
      config = lib.mkMerge [
        (lib.mkIf (config.modules.desktop.manager == "cosmic") {
          services = {
            desktopManager.cosmic.enable = true;
            desktopManager.cosmic.xwayland.enable = true;
            displayManager.cosmic-greeter.enable = true;
          };
        })
        (lib.mkIf (config.modules.desktop.manager == "plasma") {
          services = {
            displayManager.sddm = {
              enable = true;
              wayland.enable = true;
            };
            desktopManager.plasma6.enable = true;
          };

          environment.plasma6.excludePackages = with pkgs.kdePackages; [
            discover
            elisa
          ];
        })
      ];
    }
  );
}
