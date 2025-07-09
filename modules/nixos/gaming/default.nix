{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "gaming";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable gaming options";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];

      platformOptimizations.enable = true;
    };

    programs.gamemode.enable = true;
  };
}
