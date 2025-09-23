{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "nh";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable nh";
      flake = lib.mkOption {
        description = "Path to system flake";
        type = types.str;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = lib.mkDefault true;
      flake = cfg.flake;
      clean = {
        enable = true;
        extraArgs = "--keep 5";
      };
    };
  };
}
