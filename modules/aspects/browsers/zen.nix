{ inputs, ... }:
{
  flake-file.inputs = {
    nur = {
      url = "github:nix-community/nur";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  den.aspects.browsers.zen = {
    nixos = {
      nixpkgs.overlays = [
        inputs.nur.overlays.default
      ];
    };

    homeManager =
      { pkgs, ... }:
      {
        imports = [
          inputs.zen-browser.homeModules.beta
        ];

        stylix.targets.zen-browser.profileNames = [ "default" ];

        programs.zen-browser = {
          enable = true;
          nativeMessagingHosts = with pkgs; [
            keepassxc
          ];

          profiles.default = {
            extensions = {
              packages = with pkgs.nur.repos.rycee.firefox-addons; [
                keepassxc-browser
                ublock-origin
              ];
            };

            settings = {
              "extensions.autoDisableScopes" = 0;
            };

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
      };
  };
}
