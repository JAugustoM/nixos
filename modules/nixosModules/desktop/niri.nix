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
      options.modules.niri = {
        enable = lib.mkEnableOption "Enable niri";
      };

      config = lib.mkIf (cfg.enable) {
        programs.niri = {
          enable = true;
          useNautilus = false;
        };

        environment = {
          sessionVariables.NIXOS_OZONE_WL = "1";
          systemPackages = with pkgs; [
            xwayland-satellite
          ];
        };

        security.pam.services.swaylock = { };

        xdg.portal.config.niri = {
          "org.freedesktop.impl.portal.FileChooser" = lib.mkForce [ "kde" ];
        };
      };
    }
  );
}
