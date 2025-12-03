{ moduleWithSystem, ... }:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, pkgs, ... }:
    {
      sops.secrets."wireguard_vpn" = { };

      networking.firewall = {
        allowedUDPPorts = [ config.networking.wg-quick.interfaces.wg0.listenPort ];
      };

      networking.wg-quick.interfaces.wg0 = {
        dns = "10.2.0.1";
        privateKeyFile = config.sops.secrets."wireguard_vpn".path;
        address = [ "10.2.0.2/32" ];
        listenPort = 51820;

        peers = [
          {
            publicKey = "ECpPKv2/sxck/VZIcVVk+0FZfZIe9PkXI1Lcpf9KODU=";
            allowedIPs = [
              "0.0.0.0/0"
              "::/0"
            ];
            endpoint = "146.70.98.130:51820";
          }
        ];

        postUp = ''
          ${pkgs.iptables}/bin/iptables -A INPUT -i wg0 -p udp \
              --dport 1714:1764 -m state --state NEW,ESTABLISHED -j ACCEPT
          ${pkgs.iptables}/bin/iptables -A INPUT -i wg0 -p tcp \
              --dport 1714:1764 -m state --state NEW,ESTABLISHED -j ACCEPT
          ${pkgs.iptables}/bin/iptables -A OUTPUT -o wg0 -p udp \
              --sport 1714:1764 -m state --state NEW,ESTABLISHED -j ACCEPT
          ${pkgs.iptables}/bin/iptables -A OUTPUT -o wg0 -p tcp \
              --sport 1714:1764 -m state --state NEW,ESTABLISHED -j ACCEPT
        '';
      };
    }
  );
}
