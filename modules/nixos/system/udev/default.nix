{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "udev";
  cfg = config.modules.${moduleName};
  extraRules = "${builtins.concatStringsSep "\n" cfg.extraRules}";
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enables extra udev rules";
      extraRules = lib.mkOption {
        description = "Extra udev rules to add";
        type = types.listOf types.str;
        default = [];
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.udev.extraRules = extraRules;
  };
}
