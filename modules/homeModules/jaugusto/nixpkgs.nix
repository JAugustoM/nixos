{ inputs, moduleWithSystem, ... }:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ ... }:
    {
      nixpkgs = {
        overlays = with inputs; [
          nix4vscode.overlays.default
          nur.overlays.default
        ];
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "ciscoPacketTracer8-8.2.2"
          ];
        };
      };
    }
  );
}
