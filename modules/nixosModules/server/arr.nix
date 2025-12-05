{ moduleWithSystem, ... }:
{
  flake.modules.nixos.server = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      users.groups.starr = { };

      # Port 7878
      services.radarr = {
        enable = true;
        group = "starr";
      };

      # Port 8989
      services.sonarr = {
        enable = true;
        group = "starr";
      };

      # Port 8686
      services.lidarr = {
        enable = true;
        group = "starr";
      };

      # Port 8080
      services.qbittorrent = {
        enable = true;
        group = "starr";
      };
    }
  );
}
