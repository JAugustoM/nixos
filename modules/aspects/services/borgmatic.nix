{
  den.aspects.services.borgmatic =
    { user, ... }:
    let
      inherit (user) name;
    in
    {
      homeManager = {
        services.borgmatic = {
          enable = true;
          frequency = "*-*-* 19:00:00";
        };

        programs.borgmatic = {
          enable = true;
          backups.home = {
            location.excludeHomeManagerSymlinks = true;
            settings = fromTOML ''
              source_directories = [ "/home/${name}" ]
              patterns = [
                "! /home/${name}/.*",
                "! /home/${name}/Projects",
                "! /home/${name}/Games"
              ]

              encryption_passcommand = "gopass Secrets/Borgmatic"
              keep_daily = 7

              compression = "auto,zstd,11"

              [[repositories]]
              path = "/mnt/backup/${name}_backup.borg"
              label = "${name}_backup"
              encryption = "repokey"
            '';
          };
        };
      };
    };
}
