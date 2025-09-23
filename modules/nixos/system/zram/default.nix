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
  options = { };

  config = lib.mkIf (!config.modules.iso.isIso) {
    zramSwap = {
      enable = lib.mkDefault true;
      algorithm = "zstd";
      priority = 5;
      memoryPercent = 50;
    };
  };
}
