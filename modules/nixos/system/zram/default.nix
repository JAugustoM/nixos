{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "zram";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable zram";
    };
  };

  config = lib.mkIf cfg.enable {
    zramSwap = {
      enable = true;
      algorithm = "zstd";
       priority = 5;
       memoryPercent = 50;
    };
  };
}
