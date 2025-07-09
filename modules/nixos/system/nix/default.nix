{
  config,
  lib,
  inputs,
  ...
}:
let
  types = lib.types;
  moduleName = "nix";
  cfg = config.modules.${moduleName};
in
{
  options = { };

  config = {
    nixpkgs.config.allowUnfree = true;

    nix = {
      nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      settings = {
        auto-optimise-store = true;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-users = [
          "root"
          "@wheel"
        ];
      };
    };
  };
}
