{
  config,
  system,
  lib,
  ...
}:
let
  moduleName = "sops";
  cfg = config.modules.${moduleName};
  inherit (lib) types;
  inherit (config.networking) hostName;
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable sops";
      keyPath = lib.mkOption {
        description = "Path to age key";
        type = types.str;
      };
    };
  };
  config = lib.mkIf cfg.enable {
    sops.defaultSopsFile = ./. + "../../../../systems/${system}/${hostName}/secrets.yaml";
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = cfg.keyPath;
  };
}
