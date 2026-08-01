{ den, ... }: {
  den.aspects.services.navidrome = { host, user, ... }: {
    includes = [
      den.aspects.services.caddy
      den.aspects.services.tailscale
    ];

    nixos = {
      services = {
        navidrome = {
          enable = true;
          group = "music-share";
          settings = {
            MusicFolder = "/mnt/music";
            Address = "127.0.0.1";
            Port = 4533;
            BaseUrl = "/navidrome";
          };
        };

        caddy.virtualHosts."${host.hostName}.${host.tailnet}" = {
          extraConfig = ''
            reverse_proxy /navidrome* 127.0.0.1:4533
          '';
        };
      };

      users = {
        groups.music-share = { };
        users.${user.name}.extraGroups = [ "music-share" ];
      };

      systemd.tmpfiles.rules = [
        "d /mnt/music 0750 root music-share -"
      ];

      fileSystems."/mnt/music" = {
        device = "/home/${user.name}/Music";
        fsType = "none";
        options = [ "bind" ];
      };
    };
  };
}
