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
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = true;
      flake = "/home/jaugusto/.config/nixos";
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep 5";
      };
    };
  };
}
