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
      enable = lib.mkEnableOption "Enable auto-cpufreq";
    };
  };

  config = lib.mkIf cfg.enable {
    services.power-profiles-daemon.enable = false;

    programs.auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
          profile = "balanced";
        };

        charger = {
          governor = "performance";
          turbo = "auto";
          profile = "performance";
        };
      };
    };
  };
}
