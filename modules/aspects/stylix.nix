{ inputs, ... }:
{
  flake-file.inputs = {
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.stylix =
    { user, ... }:
    {
      nixos =
        { pkgs, ... }:
        {
          imports = [
            inputs.stylix.nixosModules.stylix
          ];

          stylix = {
            enable = true;
            base16Scheme = "${pkgs.base16-schemes}/share/themes/${user.theme}.yaml";
            image = ../../include/wallpapers/${user.wallpaper}.jpg;
            polarity = "dark";

            cursor = {
              name = "Bibata-Modern-Ice";
              package = pkgs.bibata-cursors;
              size = 24;
            };

            icons = {
              enable = true;
              package = pkgs.tela-icon-theme;
              dark = "Tela-dracula-dark";
              light = "Tela-dracula-light";
            };

            fonts = {
              sizes = {
                applications = 10;
                desktop = 10;
                popups = 8;
                terminal = 12;
              };

              serif = {
                package = pkgs.source-serif;
                name = "Source Serif 4";
              };

              sansSerif = {
                package = pkgs.inter;
                name = "Inter";
              };

              monospace = {
                package = pkgs.nerd-fonts.monaspace;
                name = "MonaspiceNe Nerd Font";
              };

              emoji = {
                package = pkgs.noto-fonts-color-emoji;
                name = "Noto Color Emoji";
              };
            };
          };
        };
      homeManager = {
        stylix.targets = {
          # gnome.enable = false;
          # gtk.enable = false;
        };
      };
    };
}
