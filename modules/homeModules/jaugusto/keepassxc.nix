{ lib, moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, ... }:
    let
      cfg = config.modules.keepassxc;
    in
    {
      options.modules.keepassxc.enable = lib.mkEnableOption "Enable Keepassxc";

      config = lib.mkIf (cfg.enable) {
        programs.keepassxc = {
          enable = true;
          autostart = true;

          settings = {
            General = {
              BackupBeforeSave = true;
              BackupFilePathPattern = "/data/Backups/Keepassxc/{DB_FILENAME}-{TIME}.kdbx";
              MinimizeAfterUnlock = true;
            };

            GUI = {
              ShowTrayIcon = true;
              MinimizeToTray = true;
              MinimizeOnClose = true;
            };

            Browser = {
              Enabled = true;
              UpdateBinaryPath = false;
            };
          };
        };
      };
    }
  );
}
