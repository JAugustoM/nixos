{ inputs, withSystem, ... }:
{
  flake.homeConfigurations.jaugusto = withSystem "x86_64-linux" (
    ctx@{ pkgs, ... }:
    let
      config = [ ../../homes/jaugusto/home.nix ];
      internalModules = with inputs.self.modules.homeManager; [
        default
        jaugusto
        stylix-dracula
      ];
      externalModules = with inputs; [
        nix-index-database.homeModules.nix-index
      ];
    in
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = config ++ internalModules ++ externalModules;
    }
  );
}
