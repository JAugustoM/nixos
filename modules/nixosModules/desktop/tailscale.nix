{ moduleWithSystem, ... }:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      services.tailscale = {
        enable = true;
        useRoutingFeatures = "client";
      };
    }
  );
}
