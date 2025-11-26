{ inputs, moduleWithSystem, ... }:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      imports = [ inputs.flatpak.nixosModules.nix-flatpak ];
      services.flatpak = {
        enable = true;
        update.auto = {
          enable = true;
          onCalendar = "weekly";
        };
      };
    }
  );
}
