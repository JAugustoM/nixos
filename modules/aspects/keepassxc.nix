{
  den.aspects.keepassxc = {
    homeManager = {
      xdg.autostart.enable = true;

      programs.keepassxc = {
        enable = true;
        autostart = true;
        settings = {
          General = {
            UseAtomicSaves = true;
          };
          Security = {
            ClearClipboardTimeout = 20;
            LockDatabaseIdle = true;
            LockDatabaseIdleSeconds = 1800;
            LockDatabaseScreenLock = true;
          };
          Browser = {
            Enabled = true;
            SearchInAllDatabases = true;
            UpdateBinaryPath = false;
          };
          GUI = {
            ApplicationTheme = "dark";
            MinimizeToTray = true;
            MinimizeOnClose = true;
            MinimizeOnStartup = true;
            ShowTrayIcon = true;
          };
        };
      };
    };
  };
}
