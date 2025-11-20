{ moduleWithSystem, ... }:
{
  flake.modules.nixos.laptop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
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
    }
  );
}
