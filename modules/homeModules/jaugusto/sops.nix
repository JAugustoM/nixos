{ inputs, moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ pkgs, ... }:
    home@{ config, ... }:
    let
      user = config.home.username;
    in
    {
      imports = [ inputs.sops-nix.homeManagerModules.sops ];

      home.packages = with pkgs; [
        age
        sops
      ];

      sops.defaultSopsFile = "${inputs.self}/homes/x86_64-linux/${user}/secrets.yaml";
      sops.defaultSopsFormat = "yaml";
      sops.age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
    }
  );
}
