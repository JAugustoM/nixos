{ inputs, withSystem, ... }:
{
  flake.homeConfigurations.jaugusto = withSystem "x86_64-linux" (
    ctx@{ system, ... }:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "ciscoPacketTracer8-8.2.2"
          ];
        };
      };
      config = [ ../../homes/x86_64-linux/jaugusto/home.nix ];
      internalModules = with inputs.self.modules.homeManager; [
        jaugusto
      ];
      externalModules = with inputs; [
        catppuccin.homeModules.catppuccin
        nix-index-database.homeModules.nix-index
      ];
    in
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = config ++ internalModules ++ externalModules;
    }
  );
}
