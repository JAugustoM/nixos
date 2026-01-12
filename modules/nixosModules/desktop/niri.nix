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
    in
    {
      options.modules.niri.enable = lib.mkEnableOption "Enable niri";

      config = lib.mkIf cfg.enable {
        programs.niri = {
          enable = true;
          useNautilus = false;
        };

        environment = {
          sessionVariables = {
            XDG_CONFIG_DIRS = [ "${pkgs.kdePackages.plasma-workspace}/etc/xdg" ];
            XDG_DATA_DIRS = [
              "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
              "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
            ];
            XDG_MENU_PREFIX = "plasma-";
          };

          systemPackages = with pkgs; [
            gsettings-desktop-schemas
            gtk3
            xwayland-satellite
          ];
        };
      };
    }
  );
}
