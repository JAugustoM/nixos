{ inputs, ... }:
{
  flake-file.inputs = {
    flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  den.aspects.flatpak = {
    nixos = {
      imports = [ inputs.flatpak.nixosModules.nix-flatpak ];

      services.flatpak = {
        enable = true;
        uninstallUnmanaged = true;
        uninstallUnused = true;

        update.auto = {
          enable = true;
          onCalendar = "weekly";
        };
      };
    };
  };
}
