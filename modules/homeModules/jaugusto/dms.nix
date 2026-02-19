{
  inputs,
  lib,
  moduleWithSystem,
  ...
}:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, pkgs, ... }:
    let
      cfg = config.modules.niri;
      dotfiles = config.lib.file.mkOutOfStoreSymlink "/home/jaugusto/.config/nixos/modules/homeModules/jaugusto/include";
    in
    {
      imports = [
        inputs.danksearch.homeModules.default
        inputs.dms.homeModules.dank-material-shell
        inputs.dms.homeModules.niri
        inputs.dms-plugin-registry.modules.default
      ];

      config = lib.mkIf (cfg.shell == "dms") {
        home.packages = with pkgs; [
          satty
          wl-mirror
        ];

        stylix.targets.dank-material-shell.enable = false;

        xdg.configFile.dms = {
          source = "${dotfiles}/dms";
          recursive = true;
          target = "niri/dms";
        };

        programs = {
          dsearch.enable = true;
          dank-material-shell = {
            enable = true;
            enableSystemMonitoring = false;

            niri.includes.filesToInclude = [
              "alttab"
              "binds"
              "layout"
              "outputs"
              "wpblur"
            ];

            systemd = {
              enable = true;
              target = "niri.service";
            };

            session = {
              nightModeEnable = true;
              nightModeAutoEnabled = true;
              nightModeAutoMode = "location";

              wallpaperPath = "/home/jaugusto/.config/nixos/modules/nixosModules/desktop/wallpapers/City.jpg";
            };

            plugins = {
              dankKDEConnect.enable = true;
              dankLauncherKeys.enable = true;
              displayMirror.enable = true;
              emojiLauncher.enable = true;
              webSearch.enable = true;
            };
          };

          niri.settings.environment = {
            DMS_SCEENSHOT_EDITOR = "satty";
          };
        };
      };
    }
  );
}
