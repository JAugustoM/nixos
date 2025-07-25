{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "autoUpgrade";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable autoUpgrades";
      flake = lib.mkOption {
        description = "Path of system flake";
        type = types.str;
        default = "/etc/nixos/";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    system.autoUpgrade = {
      enable = true;
      flake = cfg.flake;
      flags = [
        "--recreate-lock-file"
        "--commit-lock-file"
      ];
    };
  };
}
