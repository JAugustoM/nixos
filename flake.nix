{
  description = "My NixOS Config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Snowfall Lib
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Determinate Nix
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    # Disko
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Catppuccin Nix
    catppuccin.url = "github:catppuccin/nix";

    # Auto-cpufreq
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Plasma Manager
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # Flatpak Nix
    flatpak.url = "github:gmodena/nix-flatpak/latest";

    # Nix Alien
    nix-alien.url = "github:thiagokokada/nix-alien";

    # Fenix Rust
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix4VSCode
    nix4vscode = {
      url = "github:nix-community/nix4vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      channels-config = {
        allowUnfree = true;
      };

      snowfall = {
        namespace = "nixos";
        meta = {
          name = "pluto";
          title = "My Awesome Flake";
        };
      };

      overlays = with inputs; [
        fenix.overlays.default
        nix4vscode.overlays.default
      ];

      systems.modules.nixos = with inputs; [
        disko.nixosModules.disko
        determinate.nixosModules.default
      ];

      systems.hosts.pluto.modules = with inputs; [
        auto-cpufreq.nixosModules.default
        catppuccin.nixosModules.catppuccin
        flatpak.nixosModules.nix-flatpak

        # NixOS Hardware
        nixos-hardware.nixosModules.common-cpu-amd
        nixos-hardware.nixosModules.common-cpu-amd-pstate
        nixos-hardware.nixosModules.common-cpu-amd-zenpower
        nixos-hardware.nixosModules.common-gpu-amd
        nixos-hardware.nixosModules.common-gpu-amd-southern-islands
      ];

      homes.modules = with inputs; [
        plasma-manager.homeManagerModules.plasma-manager
        catppuccin.homeModules.catppuccin
      ];
    };
}
