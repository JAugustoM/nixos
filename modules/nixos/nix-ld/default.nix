{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "nix-ld";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable nix-ld";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
      ];
    };
  };
}
