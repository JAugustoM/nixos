{
  den.aspects.services.tailscale = {
    nixos = {
      services.tailscale = {
        enable = true;
        useRoutingFeatures = "client";
        permitCertUid = "caddy";
      };
    };
  };
}
