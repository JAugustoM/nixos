{ moduleWithSystem, lib, ... }:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    {
      config = lib.mkMerge [
        {
          services.tailscale = {
            enable = true;
            useRoutingFeatures = "client";
          };
        }
        (lib.mkIf (config.modules.caddy.enable) {
          services.tailscale.permitCertUid = "caddy";
        })
      ];
    }
  );
}
