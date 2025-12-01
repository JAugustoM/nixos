{ moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ ... }:
    {
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

          FdoSecrets.Enabled = true;
        };
      };
    }
  );
}
