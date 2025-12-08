{
  lib,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.services = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    let
      cfg = config.modules.caddy;
    in
    {
      options.modules.caddy.enable = lib.mkEnableOption "Enable caddy";

      config = lib.mkIf (cfg.enable) {
        services.caddy = {
          enable = true;
        };
      };
    }
  );
}
