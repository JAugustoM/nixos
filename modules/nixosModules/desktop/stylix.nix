{
  lib,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, pkgs, ... }:
    let
      cfg = config.modules.stylix;
      schemes = inputs.tt-schemes;
    in
    {
      imports = [
        inputs.stylix.nixosModules.stylix
      ];

      options.modules.stylix = {
        theme = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Base16 theme";
        };
        wallpaper = lib.mkOption {
          type = lib.types.enum [
            "City"
          ];
          default = "City";
          description = "Chosen wallpaper";
        };
      };

      config = {
        stylix = {
          enable = true;
          base16Scheme = lib.mkIf (cfg.theme != "") "${schemes}/base16/${cfg.theme}.yaml";
          image = ./wallpapers/${cfg.wallpaper}.jpg;
          polarity = "dark";

          cursor = {
            name = "Bibata-Modern-Ice";
            package = pkgs.bibata-cursors;
            size = 24;
          };

          fonts = {
            sizes = {
              applications = 10;
              desktop = 10;
              popups = 8;
              terminal = 12;
            };

            serif = {
              package = pkgs.noto-fonts;
              name = "Noto Serif";
            };

            sansSerif = {
              package = pkgs.noto-fonts;
              name = "Noto Sans";
            };

            monospace = {
              package = pkgs.nerd-fonts.iosevka;
              name = "Iosevka Nerd Font";
            };

            emoji = {
              package = pkgs.noto-fonts-color-emoji;
              name = "Noto Color Emoji";
            };
          };
        };
      };
    }
  );
}
