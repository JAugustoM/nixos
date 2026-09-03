{
  den.aspects.desktop.noctalia = { user, ... }: {
    homeManager =
      { config, ... }:
      let
        inherit (config.xdg) configHome;
        link = config.lib.file.mkOutOfStoreSymlink;
      in
      {
        programs.noctalia = {
          enable = true;
          systemd.enable = true;
        };

        home.file."${configHome}/niri/noctalia/config.kdl".source =
          link "${user.include}/niri/noctalia/config.kdl";
      };
  };
}
