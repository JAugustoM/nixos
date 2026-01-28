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
        };
      };
    }
  );
}
