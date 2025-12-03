{ moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, ... }:
    let
      home = config.home.homeDirectory;
    in
    {
      sops.secrets."mega_user" = { };
      sops.secrets."mega_pass" = { };

      programs.rclone = {
        enable = true;
        remotes = {
          mega = {
            config = {
              type = "mega";
              hard_delete = true;
            };
            secrets = with config.sops.secrets; {
              user = mega_user.path;
              pass = mega_pass.path;
            };
            mounts = {
              "" = {
                enable = true;
                mountPoint = "${home}/Cloud/Mega";
              };
            };
          };
        };
      };
    }
  );
}
