{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "podman";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable podman";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.containers.enable = true;
    virtualisation = {
      podman.enable = true;

    };
    environment.systemPackages = with pkgs; [
      podman-compose
      podman-tui
      podman-desktop
    ];
  };
}
