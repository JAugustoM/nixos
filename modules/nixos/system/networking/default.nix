{
  config,
  lib,
  virtual,
  ...
}:
let
  types = lib.types;
  moduleName = "networking";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      hostName = lib.mkOption {
        description = "Hostname";
        type = types.str;
        default = "nixos";
      };
    };
  };

  config = lib.mkIf (!virtual) {
    networking.hostName = cfg.hostName;

    networking.networkmanager.enable = lib.mkDefault true;
  };
}
