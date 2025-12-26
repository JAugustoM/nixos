{ moduleWithSystem, lib, ... }:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    let
      cfg = config.modules.tailscale;
    in
    {
      options.modules.tailscale.server = lib.mkEnableOption "Enable server features";

      config = lib.mkMerge [
        {
          services.tailscale = {
            enable = true;
            useRoutingFeatures = if (cfg.server) then "server" else "client";
          };
        }
        (lib.mkIf (config.modules ? caddy) {
          services.tailscale.permitCertUid = if (config.modules.caddy.enable) then "caddy" else null;
        })
      ];
    }
  );
}
