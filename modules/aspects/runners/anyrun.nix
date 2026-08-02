{ ... }:
{
  den.aspects.runners.anyrun = {
    homeManager = { pkgs, ... }: {
      programs.anyrun = {
        enable = true;

        config = {
          closeOnClick = true;
        };
      };

      systemd.user.services.anyrun = {
        Unit = {
          Description = "Anyrun Wayland Launcher Daemon";
          PartOf = [ "graphical-session.target" ];
          After = [ "graphical-session.target" ];
        };

        Service = {
          ExecStart = "${pkgs.anyrun}/bin/anyrun daemon";
          Restart = "on-failure";
          RestartSec = 2;
        };

        Install = {
          WantedBy = [ "graphical-session.target" ];
        };
      };
    };
  };
}
