{ config, lib, ... }:
{

  programs.git = {
    enable = true;
    ignores = [
      ".devenv*"
      "devenv.local.nix"
      ".direnv"
    ];
    lfs.enable = true;

    settings = {
      user.email = "joseaugustomoraes@protonmail.com";
      user.name = "José Moraes";
      credential.helper = "store";
    };
  };
}
