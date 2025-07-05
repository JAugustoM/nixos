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
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable Flatpaks";
    };
  };

  config = lib.mkIf cfg.enable {
    services.flatpak.enable = true;
  };
}
