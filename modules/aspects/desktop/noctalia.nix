{ inputs, ... }:
{
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia";
    };
  };

  den.aspects.desktop.noctalia = { user, ... }: {
    homeManager =
      { config, ... }:
      let
        inherit (config.xdg) configHome;
        link = config.lib.file.mkOutOfStoreSymlink;
      in
      {
        imports = [
          inputs.noctalia.homeModules.default
        ];

        programs.noctalia = {
          enable = true;
          systemd.enable = true;

          settings = {
            shell = {
              launch_apps_as_systemd_services = true;
            };

            system = {
              monitor.enabled = false;
            };
          };
        };

        home.file."${configHome}/niri/noctalia/config.kdl".source =
          link "${user.include}/niri/noctalia/config.kdl";
      };
  };
}
