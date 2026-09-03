{ den, ... }:
{
  den.aspects.desktop.niri = { user, ... }: {
    includes = [ den.aspects.desktop.default ];
    nixos =
      { pkgs, ... }:
      {
        security.polkit.enable = true;
        services.gnome.gnome-keyring.enable = true;

        programs.niri = {
          enable = true;
          useNautilus = false;
        };

        environment.systemPackages = with pkgs; [
          xwayland-satellite
        ];
      };

    homeManager =
      { config, ... }:
      let
        link = config.lib.file.mkOutOfStoreSymlink;
      in
      {
        home.file.".config/niri/config.kdl".source = link "${user.include}/niri/config.kdl";
      };
  };
}
