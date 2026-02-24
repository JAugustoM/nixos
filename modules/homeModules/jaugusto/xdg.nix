{
  inputs,
  lib,
  moduleWithSystem,
  ...
}:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ ... }:
    {
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "inode/directory" = "org.kde.dolphin.desktop";
          "text/plain" = "org.kde.kate.desktop";

          "application/x-extension-shtml" = "zen-beta.desktop";
          "application/x-extension-xhtml" = "zen-beta.desktop";
          "application/x-extension-html" = "zen-beta.desktop";
          "application/x-extension-xht" = "zen-beta.desktop";
          "application/x-extension-htm" = "zen-beta.desktop";
          "x-scheme-handler/unknown" = "zen-beta.desktop";
          "x-scheme-handler/mailto" = "zen-beta.desktop";
          "x-scheme-handler/chrome" = "zen-beta.desktop";
          "x-scheme-handler/about" = "zen-beta.desktop";
          "x-scheme-handler/https" = "zen-beta.desktop";
          "x-scheme-handler/http" = "zen-beta.desktop";
          "application/xhtml+xml" = "zen-beta.desktop";
          "application/json" = "zen-beta.desktop";
          "text/html" = "zen-beta.desktop";
        };
      };
    }
  );
}
