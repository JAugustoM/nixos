{ inputs, ... }:
let
  config = [ ../../systems/pluto/configuration.nix ];
  internalModules = with inputs.self.modules.nixos; [
    default
    desktop
    docker
    gaming
    pluto
    services
    podman
    stylix-dracula
  ];
  externalModules = with inputs; [
    disko.nixosModules.disko
    nixos-facter-modules.nixosModules.facter
  ];
in
{
  flake.nixosConfigurations.pluto = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = config ++ internalModules ++ externalModules;
  };
}
