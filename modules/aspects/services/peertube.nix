{ den, ... }:
{
  den.aspects.services.peertube =
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
        peertube = {
          enable = true;
          localDomain = domain;

          # Desabilita o Nginx padrão do módulo, pois usaremos o Caddy
          configureNginx = false;

          # Provisiona o banco de dados e o Redis localmente para o teste
          database.createLocally = true;
          redis.createLocally = true;

          enableWebHttps = true;

          listenHttp = 9000;
          listenWeb = 443;

          secrets.secretsFile = "/etc/peertube/secrets";
        };

        caddy.virtualHosts."${domain}" = {
          # O PeerTube precisa rodar na raiz do domínio (diferente do yarr)
          extraConfig = ''
            reverse_proxy 127.0.0.1:9000
          '';
        };
      };
    };
}
