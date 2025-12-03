{ inputs, moduleWithSystem, ... }:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      sops.defaultSopsFile = "${inputs.self}/systems/${config.networking.hostName}/secrets.yaml";
      sops.defaultSopsFormat = "yaml";
      sops.age.keyFile = "/keys.txt";
    }
  );
}
