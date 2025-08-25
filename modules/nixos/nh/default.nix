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
      flake = lib.mkOption {
        description = "Path to system flake";
        type = types.str;
      };
    };
  };

  config = {
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
