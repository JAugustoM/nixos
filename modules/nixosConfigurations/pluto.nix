{ inputs, ... }:
let
  config = [ ../../systems/x86_64-linux/pluto/configuration.nix ];
  internalModules = with inputs.self.modules.nixos; [
    default
    desktop
    docker
    gaming
    pluto
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
