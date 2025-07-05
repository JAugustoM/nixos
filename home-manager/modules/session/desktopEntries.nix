{ config, lib, pkgs, ...}:
{
  xdg.desktopEntries.kitty = {
    name = "Kitty";
    genericName = "Terminal Emulator";
    comment = "Fast, feature-rich, GPU based terminal";
    icon = "${pkgs.kitty}/share/icons/hicolor/256x256/apps/kitty.png";
    exec = "kitty";
    startupNotify = true;
    categories = [ "System" "TerminalEmulator" ];
    settings = {
      X-TerminalArgExec = "--";
      X-TerminalArgTitle = "--title";
      X-TerminalArgAppId = "--class";
      X-TerminalArgDir = "--working-directory";
      X-TerminalArgHold = "--hold";
    };
  };
}
