{ inputs, ... }:
{
  flake-file.inputs = {
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  den.aspects.nixpkgs = {
    nixos = {
      imports = [
        inputs.chaotic.nixosModules.default
      ];

      nix.settings = {
        auto-optimise-store = true;
        nix-path = [ "nixpkgs=${inputs.nixpkgs}" ];

        experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-users = [
          "root"
          "@wheel"
        ];
        extra-substituters = [
          "https://cache.nixos-cuda.org"
          "https://noctalia.cachix.org"
        ];
        extra-trusted-public-keys = [
          "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];
      };

      nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "ventoy-1.1.17"
        ];
      };
    };
  };
}
