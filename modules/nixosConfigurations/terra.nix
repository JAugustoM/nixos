{ inputs, ... }:
let
  config = [ ../../systems/terra/configuration.nix ];
  internalModules = with inputs.self.modules.nixos; [
    default
  ];
  externalModules = with inputs; [
    nixos-generators.nixosModules.all-formats
    "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
  ];
in
{
  flake.nixosConfigurations.terra = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = config ++ internalModules ++ externalModules;
  };
}
