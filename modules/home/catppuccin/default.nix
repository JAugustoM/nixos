{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "catppuccin";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable catppuccin nix";
    };
  };

  config = lib.mkIf cfg.enable {
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "sapphire";

      nvim.enable = false;
    };
  };
}
