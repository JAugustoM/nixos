{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "networking";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      hostName = lib.mkOption {
        description = "Hostname";
        type = types.str;
        default = "nixos";
      };
    };
  };

  config = {
    networking.hostName = cfg.hostName;

    networking.networkmanager.enable = true;

    networking.firewall.allowedUDPPortRanges = [
      { from = 1714; to = 1764; }
    ];

    networking.firewall.allowedTCPPortRanges = [
      { from = 1714; to = 1764; }
    ];
  };
}
