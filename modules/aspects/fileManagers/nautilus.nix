{
  den.aspects.fileManagers.nautilus = {
    nixos =
      { pkgs, ... }:
      {
        environment = {
          systemPackages = with pkgs; [
            gst_all_1.gst-plugins-bad
            gst_all_1.gst-plugins-good
            libheif
            nautilus
          ];
          pathsToLink = [ "share/thumnailers" ];
        };

        services = {
          gvfs.enable = true;
          udisks2.enable = true;
        };
      };
  };
}
