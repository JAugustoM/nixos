{
  den,
  lib,
  inputs,
  ...
}:
{
  flake-file.inputs = {
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den = {
    default = {
      nixos = {
        imports = [
          inputs.disko.nixosModules.disko
        ];

        home-manager = {
          backupFileExtension = "backup";
          useGlobalPkgs = true;
          useUserPackages = true;
        };

        programs.tack = {
          enable = true;
          nixConfTokens = true;
        };

        system.stateVersion = "26.05";
      };

      homeManager = {
        imports = [
          inputs.nix-index-database.homeModules.nix-index
        ];

        xdg.userDirs.enable = true;

        home.stateVersion = "26.05";
      };

      includes = [
        den.aspects.nixpkgs
        den.aspects.locale.ptBR
        den.batteries.define-user
        den.batteries.hostname
        den.batteries.inputs'
      ];
    };

    schema.user = {
      classes = lib.mkDefault [ "homeManager" ];
      includes = [ den.batteries.mutual-provider ];
    };
  };

  _module.args.__findFile = den.lib.__findFile;
}
