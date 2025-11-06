{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "lidarr";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable lidarr";
      flake = lib.mkOption {
        description = "Path to system flake";
        type = types.str;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.lidarr = {
      enable = true;
      openFirewall = true;
    };
  };
}
