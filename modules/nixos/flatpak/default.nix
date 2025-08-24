{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "flatpak";
  cfg = config.modules.${moduleName};
in
{
  options = { };

  config = {
    services.flatpak = {
      enable = lib.mkDefault true;
      update.auto = lib.mkDefault {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };
}
