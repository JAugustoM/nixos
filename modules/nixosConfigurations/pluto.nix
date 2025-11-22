{ inputs, ... }:
let
  config = [ ../../systems/x86_64-linux/pluto/configuration.nix ];
  internalModules = with inputs.self.modules.nixos; [
    btrfs
    default
    desktop
    docker
    gaming
    laptop
    pluto
    podman
    ssd
    zram
  ];
  externalModules = with inputs; [
    auto-cpufreq.nixosModules.default
    catppuccin.nixosModules.catppuccin
    determinate.nixosModules.default
    disko.nixosModules.disko
    flatpak.nixosModules.nix-flatpak
    home-manager.nixosModules.home-manager
    nix-gaming.nixosModules.pipewireLowLatency
    nix-gaming.nixosModules.platformOptimizations
    nixos-facter-modules.nixosModules.facter
  ];
in
{
  flake.nixosConfigurations.pluto = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = config ++ internalModules ++ externalModules;
  };
}
