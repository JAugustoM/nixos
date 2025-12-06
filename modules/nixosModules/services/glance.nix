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
      cfg = config.modules.glance;
    in
    {
      options.modules.glance.enable = lib.mkEnableOption "Enable glance";

      config = lib.mkIf (cfg.enable) {
        sops.secrets."glance_env" = { };

        # Port 8080
        services.glance = {
          enable = true;
          environmentFile = config.sops.secrets."glance_env".path;

          settings = {
            theme = lib.mkForce (import ./glance/_dracula-theme.nix);
            pages = lib.mkForce (import ./glance/_pages.nix);
          };
        };
      };
    }
  );
}
