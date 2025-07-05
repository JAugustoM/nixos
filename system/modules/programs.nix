{ config, pkgs, ... }:
{
  programs.firefox.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/jaugusto/.config/nixos";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5";
    };
  };

  services.power-profiles-daemon.enable = false;
  programs.auto-cpufreq.enable = true;
}
