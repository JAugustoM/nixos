{ lib, moduleWithSystem, ... }:
{
  flake.modules.nixos.programs = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    let
      cfg = config.modules.programs.nh;
    in
    {
      options.modules.programs.nh.enable = lib.mkEnableOption "Enable nh";

      config = lib.mkIf (cfg.enable) {
        programs.nh = {
          enable = true;
          clean = {
            enable = true;
            extraArgs = "--keep 5";
          };
        };
      };
    }
  );
}
