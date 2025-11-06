{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "jackett";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable jackett";
      flake = lib.mkOption {
        description = "Path to system flake";
        type = types.str;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.jackett = {
      enable = true;
      openFirewall = true;
    };
  };
}
