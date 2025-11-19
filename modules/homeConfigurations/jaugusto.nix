{ inputs, moduleWithSystem, ... }:
{
  flake.modules.nixos.jaugusto = moduleWithSystem (
    perSystem@{ pkgs, ... }:
    nixos@{ ... }:
    {
      home-manager = {
        backupFileExtension = "bak";
        useGlobalPkgs = true;
        useUserPackages = true;
        users.jaugusto = import ../../homes/x86_64-linux/jaugusto/home.nix {
          inherit inputs;
          inherit pkgs;
        };
      };
    }
  );
}
