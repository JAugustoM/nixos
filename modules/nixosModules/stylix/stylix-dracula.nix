{ inputs, moduleWithSystem, ... }:
{
  flake.modules.nixos.stylix-dracula = moduleWithSystem (
    perSystem@{ pkgs, ... }:
    nixos@{ ... }:
    {
      imports = [
        inputs.stylix.nixosModules.stylix
        inputs.self.modules.generic.stylix-dracula
      ];
    }
  );
}
