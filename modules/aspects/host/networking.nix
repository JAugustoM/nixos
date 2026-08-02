{
  den.aspects.networking = {
    nixos = { lib, ... }: {
      networking = {
        dhcpcd.enable = lib.mkDefault false;
        useDHCP = lib.mkDefault false;
        nameservers = lib.mkDefault [
          "127.0.0.1"
          "::1"
        ];
        networkmanager = {
          enable = true;
          dns = lib.mkDefault "none";
          wifi.backend = lib.mkDefault "iwd";
        };
        wireless.enable = lib.mkDefault false;
        wireless.iwd.enable = lib.mkDefault true;
      };
      services = {
        resolved.enable = lib.mkDefault false;

        avahi = {
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
          publish = {
            enable = true;
            addresses = true;
            domain = true;
            hinfo = true;
            userServices = true;
            workstation = true;
          };
        };

        dnscrypt-proxy = {
          enable = lib.mkDefault true;
          settings = {
            ipv6_servers = true;
            require_dnssec = true;
            require_nolog = true;
            require_nofilter = false;
            server_names = [
              "adguard-dns"
              "quad9"
            ];

            anonymized_dns = {
              routes = [
                {
                  server_name = "*";
                  via = [
                    "anon-cs-de"
                    "anon-cs-nl"
                    "anon-adguard"
                  ];
                }
              ];
            };

            blocked_names = {
              blocked_names_file = builtins.fetchurl {
                url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/wildcard/pro-onlydomains.txt";
                sha256 = "sha256-YoSv0vzUH6ZLgPNA4YV5DD7LCwJfV7pk3ivued4H2hE=";
              };
              log_file = "/var/log/dnscrypt-proxy2/blocked.log";
            };
          };
        };
      };
    };
  };
}
