{ inputs, ... }:
{
  flake.modules.nixos.default = {
    nixpkgs = {
      config.allowUnfree = true;
      overlays = with inputs; [
        nix4vscode.overlays.default
      ];
    };

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
  };
}
