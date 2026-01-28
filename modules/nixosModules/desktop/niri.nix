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
      cfg = config.modules.niri;
      desktop = config.modules.desktop.environment;
    in
    {
      imports = [
        inputs.niri.nixosModules.niri
      ];

      options.modules.niri.enable = lib.mkEnableOption "Enable niri";

      config = lib.mkIf cfg.enable {
        programs.niri = {
          enable = true;
          package = pkgs.niri;
        };

        environment = {
          sessionVariables = lib.mkIf (desktop == "plasma") {
            XDG_CONFIG_DIRS = [
              "${pkgs.kdePackages.plasma-workspace}/etc/xdg"
            ];

            XDG_MENU_PREFIX = "plasma-";
          };

          systemPackages = with pkgs; [
            xwayland-satellite
          ];
        };

        systemd.user.services.niri-flake-polkit.enable = false;

        xdg.portal = {
          extraPortals = [
            pkgs.kdePackages.xdg-desktop-portal-kde
          ];
          config.niri = {
            "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
          };
        };
      };
    }
  );
}
