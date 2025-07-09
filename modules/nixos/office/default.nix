{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "office";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable office options";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libreoffice-qt6-fresh
      hunspell
      hunspellDicts.en_US
      hunspellDicts.pt_BR
    ];
  };
}
