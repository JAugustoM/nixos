{ config, ... }:
{
  sops.secrets.git = { };

  programs.git = {
    enable = true;
    ignores = [
      ".devenv*"
      "devenv.local.nix"
      ".direnv"
    ];
    lfs.enable = true;

    includes = [
      { path = config.sops.secrets.git.path; }
    ];

    settings = {
      credential.helper = "store";
    };
  };
}
