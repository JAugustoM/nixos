{
  den.aspects.desktop.noctalia = { user, ... }: {
    homeManager =
      {
        config,
        pkgs,
        link,
        ...
      }:
      let
        inherit (config.xdg) configHome;
      in
      {
        programs.noctalia = {
          enable = true;
          systemd.enable = true;
        };

        home.packages = with pkgs; [
          bc
          curl
          grim
          hyprpicker
          imagemagick
          jq
          slurp
          swappy
          tesseract
          translate-shell
          wl-mirror
          zbar
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
