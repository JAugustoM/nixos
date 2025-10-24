let
  wallpaper = "/home/jaugusto/.config/nixos/systems/x86_64-linux/pluto/include/City.jpg";
in
{
  kconfig.settings = {
    kdeglobals = {
      KDE = {
        LookAndFeelPackage = "org.kde.breezedark.desktop";
        SingleClick = false;
      };

      General = {
        TerminalApplication = "kitty";
        TerminalService = "kitty.desktop";

        font = "Adwaita Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        fixed = "Adwaita Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        menuFont = "Adwaita Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        smallestReadableFont = "Adwaita Sans,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        toolBarFont = "Adwaita Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      };

      WM.activeFont = "Adwaita Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
    };

    kglobalshortcutsrc = {
      services."kitty.desktop"._launch = "Meta+Return";
    };

    kscreenlockerrc = {
      Greeter.Wallpaper."org.kde.image".General = {
        Image = wallpaper;
        PreviewImage = wallpaper;
      };
    };

    kxkbrc = {
      Layout.Options = "caps:escape";
    };

    plasmarc = {
      Wallpapers.usersWallpapers = wallpaper;
    };
  };
}
