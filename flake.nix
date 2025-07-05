{
  description = "My NixOS Config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    lix-module.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.2-1.tar.gz";
    lix-module.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    auto-cpufreq.url = "github:AdnanHodzic/auto-cpufreq";
    auto-cpufreq.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, lix-module, home-manager, catppuccin, auto-cpufreq, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/configuration.nix
        lix-module.nixosModules.default
        home-manager.nixosModules.home-manager
        auto-cpufreq.nixosModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.jaugusto = {
            imports = [
              ./home-manager/home.nix
              catppuccin.homeModules.catppuccin
            ];
          };
        }
      ];
    };
  };
}
