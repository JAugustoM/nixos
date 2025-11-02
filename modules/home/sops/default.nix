{
  config,
  pkgs,
  lib,
  ...
}:
let
  moduleName = "sops";
  cfg = config.homeModules.${moduleName};
  inherit (lib) types;
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  options = {
    homeModules.${moduleName} = {
      enable = lib.mkEnableOption "Enable sops";
      hostName = lib.mkOption {
        description = "Host name";
        type = types.str;
      };
      keyPath = lib.mkOption {
        description = "Path to age key";
        type = types.str;
      };
    };
  };
  config = lib.mkIf cfg.enable {
    sops.defaultSopsFile = ./. + "../../../../systems/${system}/${cfg.hostName}/secrets.yaml";
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = cfg.keyPath;
  };
}
