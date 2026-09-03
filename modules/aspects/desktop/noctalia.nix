{
  den.aspects.desktop.noctalia = { user, ... }: {
    homeManager =
      { config, pkgs, ... }:
      let
        inherit (config.xdg) configHome;
        link = config.lib.file.mkOutOfStoreSymlink;
      in
      {
        programs.noctalia = {
          enable = true;
          systemd.enable = true;
        };

        home.packages = with pkgs; [
          wl-mirror
        ];

        home.file = {
          # Niri Config
          "${configHome}/niri/noctalia/config.kdl".source = link "${user.include}/niri/noctalia/config.kdl";

          # Noctalia Config
          "${configHome}/noctalia/settings.toml".source = link "${user.include}/noctalia/settings.toml";
        };
      };
  };
}
