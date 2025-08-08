{
  config,
  lib,
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
      flakePath = lib.mkOption {
        description = "Path of system flake";
        type = types.str;
        default = "/etc/nixos/";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = true;
      flake = cfg.flakePath;
      clean = lib.mkDefault {
        enable = true;
        dates = "daily";
        extraArgs = "--keep 5";
      };
    };
  };
}
