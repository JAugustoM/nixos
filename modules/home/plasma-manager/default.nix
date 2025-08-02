{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "plasma-manager";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable plasma-manager";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.plasma = {
      enable = true;
      configFile = import ./include/configFile.nix;
      fonts = import ./include/fonts.nix;
      hotkeys = import ./include/hotkeys.nix;
      input = import ./include/input.nix;
      kscreenlocker.appearance.wallpaper = ./media/City.jpg;
      panels = import ./include/panels.nix;
      workspace = import ./include/workspace.nix;
    };
  };
}
