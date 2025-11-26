{ inputs, moduleWithSystem, ... }:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      imports = [ inputs.determinate.nixosModules.default ];

      nix = {
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
        };
      };

      nixpkgs = {
        config.allowUnfree = true;
        overlays = with inputs; [
          nix4vscode.overlays.default
        ];
      };
    }
  );
}
