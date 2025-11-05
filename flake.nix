{
  description = "My NixOS Config";
  inputs = {
    # Package Repositories
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # System
    auto-cpufreq.url = "github:AdnanHodzic/auto-cpufreq";
    auto-cpufreq.inputs.nixpkgs.follows = "nixpkgs";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    nixos-facter-modules.url = "github:numtide/nixos-facter-modules";

    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";

    snowfall-lib.url = "github:snowfallorg/lib";
    snowfall-lib.inputs.nixpkgs.follows = "nixpkgs";

    # Configuration
    catppuccin.url = "github:catppuccin/nix";

    flatpak.url = "github:gmodena/nix-flatpak/latest";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix4vscode.url = "github:nix-community/nix4vscode";
    nix4vscode.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    nix-gaming.url = "github:fufexan/nix-gaming";
  };

  outputs =
    inputs@{ ... }:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      channels-config = {
        allowUnfree = true;
      };

      snowfall = {
        namespace = "local";
        meta = {
          name = "pluto";
          title = "My Awesome Flake";
        };
      };

      overlays = with inputs; [
        nix4vscode.overlays.default
      ];

      systems.modules.nixos = with inputs; [
        auto-cpufreq.nixosModules.default
        catppuccin.nixosModules.catppuccin
        chaotic.nixosModules.default
        determinate.nixosModules.default
        disko.nixosModules.disko
        flatpak.nixosModules.nix-flatpak
        nix-gaming.nixosModules.pipewireLowLatency
        nix-gaming.nixosModules.platformOptimizations
        nixos-facter-modules.nixosModules.facter
      ];

      homes.modules = with inputs; [
        catppuccin.homeModules.catppuccin
        nix-index-database.homeModules.nix-index
      ];
    };
}
