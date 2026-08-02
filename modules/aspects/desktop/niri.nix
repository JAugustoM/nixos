{ den, ... }:
{
  den.aspects.desktop.niri = { user, ... }: {
    includes = [ den.aspects.desktop.default ];
    nixos =
      { pkgs, ... }:
      {
        security.polkit.enable = true;
        services.gnome.gnome-keyring.enable = true;

        programs.niri = {
          enable = true;
          useNautilus = false;
        };

        environment.systemPackages = with pkgs; [
          jq
          seahorse
          xwayland-satellite
          wl-mirror
        ];

        systemd.user.services.polkit-gnome-authentication-agent-1 = {
          description = "polkit-gnome-authentication-agent-1";
          wantedBy = [ "graphical-session.target" ];
          wants = [ "graphical-session.target" ];
          after = [ "graphical-session.target" ];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
          };
        };
      };

    homeManager =
      { config, ... }:
      let
        link = config.lib.file.mkOutOfStoreSymlink;
      in
      {
        home.file.".config/niri/config.kdl".source = link "${user.include}/niri/config.kdl";
      };
  };
}
