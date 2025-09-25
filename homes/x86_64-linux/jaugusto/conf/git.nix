{ ... }:
{
  programs.git = {
    enable = true;
    ignores = [
      ".devenv*"
      "devenv.local.nix"
      ".direnv"
    ];
    lfs.enable = true;
    userEmail = "joseaugustomoraes@protonmail.com";
    userName = "José Moraes";
    extraConfig = {
      credential.helper = "store";
    };
  };
}
