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
      url = "${config.networking.hostName}.snapper-boa.ts.net";
    in
    {
      options.modules.glance.enable = lib.mkEnableOption "Enable glance";

      config = lib.mkMerge [
        (lib.mkIf (cfg.enable) {
          sops.secrets."glance_env" = { };

          # Port 8080
          services.glance = {
            enable = true;
            environmentFile = config.sops.secrets."glance_env".path;

            settings = {
              theme = lib.mkForce (import ./glance/_dracula-theme.nix);
              pages = lib.mkForce (import ./glance/_pages.nix);

              server.proxied = true;
            };
          };
        })
        (lib.mkIf (config.modules.caddy.enable) {
          services.caddy.virtualHosts."${url}".extraConfig = ''
            reverse_proxy 127.0.0.1:8080
          '';

          networking.firewall.allowedTCPPorts = [
            80
            443
          ];
        })
      ];
    }
  );
}
