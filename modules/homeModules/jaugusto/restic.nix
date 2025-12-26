{ moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, ... }:
    let
      home = config.home.homeDirectory;
    in
    {
      sops.secrets."restic_repo_pass" = { };

      services.restic = {
        enable = true;

        backups.mega = {
          repository = "rclone:mega:Backup";
          initialize = true;
          inhibitsSleep = true;

          paths = [ home ];
          exclude = [
            "${home}/.*"
            "${home}/Games"
            "${home}/Cloud"
          ];

          timerConfig = {
            OnCalendar = "19:00";
            Persistent = true;
          };

          passwordFile = config.sops.secrets."restic_repo_pass".path;

          pruneOpts = [
            "--keep-daily 7"
          ];
        };
      };
    }
  );
}
