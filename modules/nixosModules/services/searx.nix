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
      port = "8888";
      url = "${config.networking.hostName}.snapper-boa.ts.net:8088";
    in
    {
      options.modules.searx.enable = lib.mkEnableOption "Enable searx";

      config = lib.mkMerge [
        (lib.mkIf (cfg.enable) {
          sops.secrets."searx_secret" = { };

          services.searx = {
            enable = true;
            settings = {
              server = {
                base_url = "https://${url}";
                secret_key = config.sops.secrets."searx_secret".path;
                method = "GET";
              };

              engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
                "ahmia".disabled = true;
                "startpage".disabled = true;
                "torch".disabled = true;
              };
            };
          };
        })
        (lib.mkIf (config.modules.caddy.enable) {
          services.caddy.virtualHosts."${url}".extraConfig = ''
            reverse_proxy 127.0.0.1:${port}
          '';
        })
      ];
    }
  );
}
