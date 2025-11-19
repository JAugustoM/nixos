{ ... }:
{
  flake.modules.nixos.desktop = {
    services.flatpak = {
      enable = true;
      update.auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };
}
