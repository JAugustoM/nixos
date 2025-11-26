{ inputs, withSystem, ... }:
{
  flake.modules.homeManager.stylix-dracula = withSystem "x86_64-linux" (
    ctx@{ pkgs, ... }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];

      stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";

        targets = {
          zen-browser.profileNames = [ "default" ];
        };

        fonts = {
          serif = {
            package = pkgs.noto-fonts;
            name = "Noto Serif";
          };

          sansSerif = {
            package = pkgs.adwaita-fonts;
            name = "Adwaita Sans";
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
