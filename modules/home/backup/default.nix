{
  config,
  lib,
  pkgs,
  ...
}:
let
  moduleName = "backup";
  cfg = config.homeModules.${moduleName};
in
{
  options = {
    homeModules.${moduleName} = {
      enable = lib.mkEnableOption "Enable automatic backups with Borgmatic";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      borgbackup
      borgmatic
      pass
    ];

    services.borgmatic = {
      enable = true;
      frequency = "daily";
    };

    programs.borgmatic = {
      enable = true;
      backups.personal = {
        location = {
          excludeHomeManagerSymlinks = true;
          sourceDirectories = [ "/home/${config.home.username}" ];
          repositories = [
            {
              label = "home";
              path = "/data/borgmatic/home-backup";
            }
          ];
        };

        consistency.checks = [
          {
            name = "repository";
            frequency = "1 week";
          }
          {
            name = "archives";
            frequency = "2 weeks";
          }
        ];

        retention = {
          keepDaily = 7;
        };

        storage.encryptionPasscommand = "${pkgs.pass}/bin/pass borg/pluto-backup";

        output.extraConfig = {
          compression = "zstd";

          check_last = 3;

          exclude_patterns = [
            "~/.cache"
            "**/.cache"
            "~/.local/share/Trash"
            "*.bak"
            "**/node_modules"
          ];

          healthchecks.ping_url = "https://hc-ping.com/3d0e8f5e-b357-45a6-93ef-c0b46d27a5f0";
        };
      };
    };
  };
}
