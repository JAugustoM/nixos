{
  inputs,
  lib,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    let
      cfg = config.modules.home-manager;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      options.modules.home-manager.user = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "Home Manager user configuration";
      };

      config = lib.mkIf (cfg.user != "") {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
          users.jaugusto = ../../../homes/${cfg.user}/home.nix;
          backupFileExtension = "backup";
        };
      };
    }
  );
}
