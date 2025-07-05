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
      fonts = import ./fonts.nix;
      hotkeys = import ./hotkeys.nix;
      workspace = import ./workspace.nix;
    };
  };
}
