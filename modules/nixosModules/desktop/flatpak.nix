{ inputs, moduleWithSystem, ... }:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      imports = [ inputs.flatpak.nixosModules.nix-flatpak ];

      services.flatpak = {
        enable = true;
        uninstallUnmanaged = true;
        uninstallUnused = true;

        update.auto = {
          enable = true;
          onCalendar = "weekly";
        };

        overrides.global = {
          Context.sockets = [
            "wayland"
            "!x11"
            "!fallback-x11"
          ];
          Environment.XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
        };
      };
    }
  );
}
