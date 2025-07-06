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
      fonts = import ./include/fonts.nix;
      hotkeys = import ./include/hotkeys.nix;
      workspace = import ./include/workspace.nix;
      input = import ./include/input.nix;
    };
  };
}
