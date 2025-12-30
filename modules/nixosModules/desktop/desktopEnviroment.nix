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
        inputs.dms.nixosModules.dankMaterialShell
        inputs.dms.nixosModules.greeter
      ];

      options.modules.desktop.environment = lib.mkOption {
        type = lib.types.enum [
          ""
          "cosmic"
          "dms"
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
        (lib.mkIf (cfg.environment == "dms") {
          programs = {
            dsearch.enable = true;

            dankMaterialShell = {
              enable = true;

              greeter = {
                enable = true;
                compositor.name = "niri";
                configHome = "/home/${config.modules.home-manager.user}";
              };

              systemd = {
                enable = true;
                restartIfChanged = true;
              };
            };

            niri.enable = true;
          };

          environment.sessionVariables.NIXOS_OZONE_WL = "1";
          environment.systemPackages = with pkgs; [
            kdePackages.ark
            kdePackages.dolphin
            kdePackages.gwenview
            kdePackages.okular
            satty
            xwayland-satellite
            wl-mirror
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

          environment.plasma6.excludePackages = with pkgs.kdePackages; [
            discover
            elisa
          ];
        })
      ];
    }
  );
}
