{ den, ... }:
{
  den.aspects.services.freshrss =
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
        freshrss = {
          enable = true;

          webserver = "caddy";
          baseUrl = "https://${domain}";
          virtualHost = domain;

          defaultUser = "admin";
          passwordFile = "/var/lib/freshrss/admin_password";
        };
      };
    };
}
