{ moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, pkgs, ... }:
    let
      user = config.home.username;
      home = config.home.homeDirectory;
    in
    {
      sops.secrets."borgmatic_passphrase" = { };

      home.packages = [ pkgs.borgmatic ];

      services.borgmatic = {
        enable = true;
        frequency = "*-*-* 21:00:00";
      };

      programs.borgmatic = {
        enable = true;
        backups = {
          home = {
            retention.keepDaily = 7;
            location = {
              repositories = [
                {
                  path = "/data/Backups/backup-${user}";
                  label = "home";
                }
                {
                  path = "${home}/Cloud/Mega/backup-${user}";
                  label = "mega";
                }
              ];
              patterns = [
                "R ${home}"
                "! ${home}/Games"
                "! ${home}/.*"
              ];
              excludeHomeManagerSymlinks = true;
            };
            consistency.checks = [
              {
                name = "archives";
                frequency = "2 weeks";
              }
              {
                name = "repository";
                frequency = "2 weeks";
              }
              {
                name = "data";
                frequency = "1 month";
              }
            ];
            storage.extraConfig = {
              compression = "auto,zstd,14";
              healthchecks.ping_url = "https://hc-ping.com/3d0e8f5e-b357-45a6-93ef-c0b46d27a5f0";
              encryption_passphrase = "{credential file ${config.sops.secrets."borgmatic_passphrase".path}}";
            };
          };
        };
      };
    }
  );
}
