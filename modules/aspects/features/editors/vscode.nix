{ inputs, ... }:
{
  flake-file.inputs = {
    nix4vscode = {
      url = "github:nix-community/nix4vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.editors.vscode = {
    nixos = {
      nixpkgs.overlays = [
        inputs.nix4vscode.overlays.default
      ];
    };

    homeManager =
      { pkgs, ... }:
      {
        programs.vscodium.enable = true;

        home.packages = with pkgs; [
          clang-tools
          just-lsp
          nixd
          nixfmt
          ruff
          slint-lsp
        ];
      };
  };
}
