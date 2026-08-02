{ den, ... }:
{
  den.aspects.services.yarr =
    { host, ... }:
    let
      domain = "${host.hostName}.${host.tailnet}";
    in
    {
      includes = [
        den.aspects.services.caddy
        den.aspects.services.tailscale
      ];

      nixos.services = {
        yarr = {
          enable = true;
          baseUrl = "feed";

          address = "127.0.0.1";
          port = 7070;
        };

        caddy.virtualHosts."${domain}" = {
          extraConfig = ''
            reverse_proxy /feed* 127.0.0.1:7070
          '';
        };
      };
    };
}
