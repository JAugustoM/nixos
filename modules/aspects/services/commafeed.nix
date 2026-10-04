{ den, ... }:
{
  den.aspects.services.commafeed =
    { host, ... }:
    {
      includes = [
        den.aspects.services.caddy
        den.aspects.services.tailscale
      ];

      nixos.services = {
        commafeed.enable = true;

        caddy.virtualHosts."${host.hostName}.${host.tailnet}" = {
          extraConfig = ''
            reverse_proxy 127.0.0.1:8082
          '';
        };
      };
    };
}
