{
  den.aspects.fileManagers.dolphin = {
    nixos = { pkgs, lib, ... }: {
      environment.etc."xdg/menus/applications.menu".source =
        "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

      environment.systemPackages = with pkgs; [
        kdePackages.dolphin
        kdePackages.qtsvg
        kdePackages.kio-admin
        kdePackages.kio-extras
        kdePackages.kio-fuse
        kdePackages.kdegraphics-thumbnailers
        kdePackages.kimageformats
        kdePackages.ark
      ];

      environment.sessionVariables = {
        QT_QPA_PLATFORM = "wayland;xcb";
      };

      xdg.mime.enable = true;
      xdg.menus.enable = true;

      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];

        config.niri."org.freedesktop.impl.portal.FileChooser" = lib.mkForce "kde";
      };
    };
  };
}
