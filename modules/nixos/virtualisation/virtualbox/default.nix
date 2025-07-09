{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "virtualbox";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable VirtualBox";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = lib.mkDefault true;
    };
  };
}
