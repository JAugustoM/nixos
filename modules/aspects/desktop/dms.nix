{ den, inputs, ... }:
{
  flake-file.inputs = {
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.desktop.dms = { user, ... }: {
    includes = [ den.aspects.desktop.default ];
    nixos = { pkgs, ... }: {
      imports = [
        inputs.dms-plugin-registry.nixosModules.default
      ];

      environment.systemPackages = with pkgs; [
        satty
        wl-mirror
      ];

      programs = {
        dms-shell = {
          enable = true;
          systemd = {
            enable = true;
            restartIfChanged = true;
            target = "niri.service";
          };
          plugins = {
            niriDS.enable = true;
          };
        };
      };
    };

    homeManager =
      { config, ... }:
      let
        link = config.lib.file.mkOutOfStoreSymlink;
      in
      {
        home.file = {
          ".config/DankMaterialShell".source = link "${user.include}/dms";
          ".config/niri/dms".source = link "${user.include}/niri/dms";
        };
      };
  };
}
