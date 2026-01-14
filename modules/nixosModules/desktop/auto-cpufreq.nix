{
  lib,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, pkgs, ... }:
    let
      cfg = config.modules.auto-cpufreq;
    in
    {
      imports = [
        inputs.auto-cpufreq.nixosModules.default
      ];

      options.modules.auto-cpufreq.enable = lib.mkEnableOption "Enable auto-cpufreq";

      config = lib.mkIf cfg.enable {
        services.power-profiles-daemon.enable = false;

        programs.auto-cpufreq = {
          enable = true;
          settings = {
            charger = {
              governor = "performance";
              turbo = "auto";

              energy_performance_preference = "performance";
              platform_profile = "performance";
            };
            battery = {
              governor = "powersave";
              turbo = "never";

              energy_performance_preference = "power";
              platform_profile = "low-power";

              enable_thresholds = true;
              start_threshold = 75;
              stop_threshold = 80;
            };
          };
        };
      };
    }
  );
}
