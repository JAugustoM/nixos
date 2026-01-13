{
  lib,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, pkgs, ... }:
    let
      cfg = config.modules.sops;
      user = config.home.username;
    in
    {
      imports = [ inputs.sops-nix.homeManagerModules.sops ];

      options.modules.sops.enable = lib.mkEnableOption "Enable sops";

      config = {
        home.packages = with pkgs; [
          age
          sops
        ];

        sops.defaultSopsFile = "${inputs.self}/homes/${user}/secrets.yaml";
        sops.defaultSopsFormat = "yaml";
        sops.age.keyFile = "/keys.txt";
      };
    }
  );
}
