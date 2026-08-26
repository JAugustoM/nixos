{ inputs, ... }:
{
  den.aspects.nixpkgs = {
    nixos =
      { pkgs, ... }:
      {
        nix = {
          package = pkgs.lixPackageSets.stable.lix;
          nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

          settings = {
            auto-optimise-store = true;
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
              "https://helix.cachix.org"
            ];
            extra-trusted-public-keys = [
              "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
              "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
              "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
            ];
          };
        };
        nixpkgs = {
          config = {
            allowUnfree = true;
            permittedInsecurePackages = [
              "ventoy-1.1.17"
            ];
          };
          overlays = [
            (final: prev: {
              inherit (prev.lixPackageSets.stable)
                nixpkgs-review
                nix-eval-jobs
                nix-fast-build
                colmena
                ;
            })
          ];
        };
      };
  };
}
