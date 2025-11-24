{ inputs, withSystem, ... }:
{
  flake.modules.homeManager.jaugusto = withSystem "x86_64-linux" (
    ctx@{
      system,
      inputs',
      ...
    }:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          inputs.nur.overlays.default
        ];
        config = {
          allowUnfree = true;
        };
      };
      inherit (builtins) readFile;
    in
    {
      imports = [
        inputs.zen-browser.homeModules.beta
      ];

      programs.zen-browser = {
        enable = true;
        nativeMessagingHosts = with pkgs; [
          kdePackages.plasma-browser-integration
          keepassxc
        ];

        profiles.default = {
          extensions = {
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              keepassxc-browser
              plasma-integration
              privacy-badger
              ublock-origin
            ];
          };

          settings = {
            "extensions.autoDisableScopes" = 0;
          };

          extraConfig = readFile ./user.js;

          search = {
            force = true;
            default = "ddg";
            privateDefault = "ddg";

            engines = {
              "Nix Packages" = {
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "channel";
                        value = "unstable";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };

              "Nix Options" = {
                urls = [
                  {
                    template = "https://search.nixos.org/options";
                    params = [
                      {
                        name = "channel";
                        value = "unstable";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@no" ];
              };

              "NixOS Wiki" = {
                urls = [
                  {
                    template = "https://wiki.nixos.org/w/index.php";
                    params = [
                      {
                        name = "search";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@nw" ];
              };
            };
          };
        };
      };
    }
  );
}
