{
  den.aspects.services.syncthing =
    { user, ... }:
    {
      nixos = {
        services.syncthing = {
          enable = true;
          user = "${user.name}";
          dataDir = "/home/${user.name}/.local/share/syncthing";
          configDir = "/home/${user.name}/.config/syncthing";

          openDefaultPorts = true;

          settings = {
            options = {
              globalAnnounceEnabled = false;
              relaysEnabled = false;
              localAnnounceEnabled = true;
            };

            devices = {
              "moto-g75" = {
                id = "CED4R4Z-AGN5E7T-YJOADMF-BY3W4J7-YLE6JG4-UF6JAEI-XOGEEX5-IBTQHQJ";
                addresses = [ "tcp://100.84.226.104:22000" ];
              };
            };

            folders = {
              "KeePassXC" = {
                path = "/home/${user.name}/KeePassXC";
                devices = [ "moto-g75" ];
                versioning = {
                  type = "simple";
                  params.keep = "5";
                };
              };
              "Music" = {
                path = "/home/${user.name}/Music";
                devices = [ "moto-g75" ];
                versioning = {
                  type = "simple";
                  params.keep = "1";
                };
              };
            };
          };
        };
      };
    };
}
