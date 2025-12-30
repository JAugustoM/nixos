{ inputs, moduleWithSystem, ... }:
{
  flake.modules.nixos.stylix-dracula = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ pkgs, ... }:
    {
      imports = [
        inputs.stylix.nixosModules.stylix
      ];

      stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
        image = ./wallpapers/City.jpg;

        cursor = {
          name = "Breeze Dark";
          package = pkgs.kdePackages.breeze-icons;
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
    }
  );
}
