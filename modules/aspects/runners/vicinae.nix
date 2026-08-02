{ inputs, lib, ... }:
{
  flake-file.inputs = {
    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.runners.vicinae = { user, ... }: {
    homeManager =
      { config, pkgs, ... }:
      let
        link = config.lib.file.mkOutOfStoreSymlink;
      in
      {
        home.file.".config/vicinae/settings.json".source = link "${user.include}/vicinae/settings.json";

        programs.vicinae = {
          enable = true;
          package = pkgs.vicinae;

          systemd = {
            enable = true;
            autoStart = true;
          };

          settings = lib.mkForce { };

          extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
            aria2-manager
            iconify
            nerdfont-search
            nix
            player-pilot
          ];
        };
      };
  };
}
