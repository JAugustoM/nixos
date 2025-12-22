{
  lib,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, pkgs, ... }:
    let
      cfg = config.modules.protonmail-bridge;
    in
    {
      options.modules.protonmail-bridge.enable = lib.mkEnableOption "Enable protonmail-bridge";

      config = lib.mkIf (cfg.enable) {
        services.protonmail-bridge = {
          enable = true;
          path = if (config.modules.desktop.environment == "cosmic") then [
            pkgs.gnome-keyring
          ] else if (config.modules.desktop.environment == "plasma") then [
            pkgs.kdePackages.kwallet
          ] else [ ];
        };
      };
    }
  );
}
