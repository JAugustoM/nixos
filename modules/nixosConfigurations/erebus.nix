{ inputs, ... }:
let
  config = [ ../../systems/erebus/configuration.nix ];
  internalModules = with inputs.self.modules.nixos; [
    default
    desktop
    programs
    services
  ];
  externalModules = with inputs; [
    disko.nixosModules.disko
    nixos-facter-modules.nixosModules.facter
  ];
in
{
  flake.nixosConfigurations.erebus = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = config ++ internalModules ++ externalModules;
  };
}
