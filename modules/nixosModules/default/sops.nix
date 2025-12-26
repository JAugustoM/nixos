{
  lib,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    let
      cfg = config.modules.sops;
    in
    {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      options.modules.sops.enable = lib.mkEnableOption "Enable sops";

      config = lib.mkIf (cfg.enable) {
        sops.defaultSopsFile = "${inputs.self}/systems/${config.networking.hostName}/secrets.yaml";
        sops.defaultSopsFormat = "yaml";
        sops.age.keyFile = "/keys.txt";
      };
    }
  );
}
