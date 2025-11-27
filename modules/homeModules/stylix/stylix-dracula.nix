{ inputs, withSystem, ... }:
{
  flake.modules.homeManager.stylix-dracula = withSystem "x86_64-linux" (
    ctx@{ pkgs, ... }:
    {
      imports = [
        inputs.stylix.homeModules.stylix
        inputs.self.modules.generic.stylix-dracula
      ];

      stylix = {
        targets = {
          zen-browser.profileNames = [ "default" ];
        };
      };
    }
  );
}
