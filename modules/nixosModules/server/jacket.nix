{ moduleWithSystem, ... }:
{
  flake.modules.nixos.server = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      # Port 9117
      services.jackett = {
        enable = true;
      };

      # Port 8191
      services.flaresolverr = {
        enable = true;
      };
    }
  );
}
