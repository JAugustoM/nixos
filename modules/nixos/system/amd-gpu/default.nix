{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "amd-gpu";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable AMD GPU options";
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = [ "amdgpu" ];
  };
}
