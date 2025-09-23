{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "docker";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable docker";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation = {
      docker.enable = true;
      docker.storageDriver = "btrfs";
    };
  };
}
