{ moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ pkgs, ... }:
    home@{ config, ... }:
    let
      user = config.home.username;
      home = config.home.homeDirectory;
    in
    {
      sops.secrets."borgmatic_passphrase" = { };

      sops.secrets."borgmatic_healthchecks" = { };

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
              compression = "auto,zstd,7";
              healthchecks.ping_url = "{credential file ${config.sops.secrets."borgmatic_healthchecks".path}}";
              encryption_passphrase = "{credential file ${config.sops.secrets."borgmatic_passphrase".path}}";
            };
          };
        };
      };
    }
  );
}
