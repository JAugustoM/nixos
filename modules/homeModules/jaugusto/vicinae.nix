{
  lib,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, pkgs, ... }:
    let
      cfg = config.modules.vicinae;
    in
    {
      imports = [
        inputs.vicinae.homeManagerModules.default
      ];

      options.modules.vicinae.enable = lib.mkEnableOption "Enable vicinae";

      config = lib.mkIf cfg.enable {
        services.vicinae = {
          enable = true;
          systemd = {
            enable = true;
            autoStart = true;
            environment = {
              USE_LAYER_SHELL = 1;
            };
          };

          settings = {
            escape_key_behavior = "close_window";
            close_on_focus_loss = true;
            pop_to_root_on_close = true;

            providers = {
              "files".entrypoints = {
                search.alias = "@fs";
              };

              "@ozer-01/vicinae-extension-aria2-manager-0".entrypoints = {
                index.alias = "@ad";
                quick-add.alias = "@aa";
              };

              "@knoopx/vicinae-extension-nix-0".entrypoints = {
                home-manager-options.alias = "@nh";
                options.alias = "@no";
                packages.alias = "@np";
              };

              "@Ninetonine/vicinae-extension-searxng-0" = {
                entrypoints = {
                  search-with-searxng.alias = "@sx";
                };
                preferences = {
                  instance_domain = "https://erebus.snapper-boa.ts.net:8088";
                };
              };
            };
          };

          extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
            aria2-manager
            nix
            searxng
          ];
        };
      };
    }
  );
}
