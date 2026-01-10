{
  lib,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, pkgs, ... }:
    let
      cfg = config.modules.desktop;
    in
    {
      imports = [
        inputs.dms.nixosModules.greeter
      ];

      options.modules.desktop.environment = lib.mkOption {
        type = lib.types.enum [
          ""
          "cosmic"
          "plasma"
        ];
        default = "";
        description = "The desktop manager to use.";
      };

      config = lib.mkMerge [
        (lib.mkIf (cfg.environment == "cosmic") {
          services = {
            desktopManager.cosmic.enable = true;
            desktopManager.cosmic.xwayland.enable = true;
            displayManager.cosmic-greeter.enable = true;
            system76-scheduler.enable = true;
          };
          environment.cosmic.excludePackages = with pkgs; [
            cosmic-edit
            cosmic-player
            cosmic-store
            cosmic-term
          ];
        })
        (lib.mkIf (cfg.environment == "plasma") {
          services = {
            displayManager.sddm = {
              enable = true;
              wayland.enable = true;
            };
            desktopManager.plasma6.enable = true;
          };

          environment = {
            plasma6.excludePackages = with pkgs.kdePackages; [
              discover
              elisa
            ];
            systemPackages = with pkgs; [
              haruna
            ];
          };
        })
      ];
    }
  );
}
