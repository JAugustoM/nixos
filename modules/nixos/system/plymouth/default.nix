{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "plymouth";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable plymouth";
    };
  };

  config = lib.mkIf cfg.enable {
    boot = {
      consoleLogLevel = 3;
      initrd.verbose = false;
      initrd.systemd.enable = true;
      kernelParams = [
        "quiet"
        "splash"
        "intremap=on"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
      ];

      plymouth.enable = true;
    };
  };
}
