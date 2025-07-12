{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "auto-cpufreq";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable Auto-CPUFreq";
    };
  };
  config = lib.mkIf cfg.enable {
    services.power-profiles-daemon.enable = false;
    programs.auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };
        battery = {
          governor = "powersave";
          turbo = "auto";
        };
      };
    };
  };
}
