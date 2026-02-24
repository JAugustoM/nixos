{ lib, moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, pkgs, ... }:
    let
      cfg = config.modules.borgmatic;
      user = config.home.username;
      home = config.home.homeDirectory;
    in
    {
      options.modules.borgmatic = {
        enable = lib.mkEnableOption "Enable borgmatic";
      };

      config = lib.mkIf cfg.enable {
        home.packages = [ pkgs.borgmatic ];

        services.borgmatic = {
          enable = true;
          frequency = "*-*-* 19:00:00";
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
                  "! ${home}/Cloud"
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
                # healthchecks.ping_url = "";
                encryption_passphrase = "{credential file ${home}/.borg_pass";
              };
            };
          };
        };
      };
    }
  );
}
