{ inputs, moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, pkgs, ... }:
    let
      user = config.home.username;
    in
    {
      imports = [ inputs.sops-nix.homeManagerModules.sops ];

      home.packages = with pkgs; [
        age
        sops
      ];

      sops.defaultSopsFile = "${inputs.self}/homes/${user}/secrets.yaml";
      sops.defaultSopsFormat = "yaml";
      sops.age.keyFile = "/keys.txt";
    }
  );
}
