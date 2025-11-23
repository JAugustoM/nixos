{ inputs, ... }:
let
  config = [ ../../systems/x86_64-linux/terra/configuration.nix ];
  internalModules = with inputs.self.modules.nixos; [
    default
  ];
  externalModules = with inputs; [
    determinate.nixosModules.default
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
