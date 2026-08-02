{ den, ... }:
{
  den.aspects.boot = {
    provides = {
      default.nixos = {
        boot = {
          initrd.systemd.enable = true;

          tmp = {
            useTmpfs = true;
            tmpfsSize = "50%";
          };
        };
      };
      limine =
        { host, ... }:
        {
          includes = [
            den.aspects.boot._.default
          ];
          nixos =
            { pkgs, ... }:
            {
              boot.loader.limine = {
                enable = true;
                maxGenerations = 5;
                secureBoot = {
                  enable = host.secureBoot;
                  autoGenerateKeys = true;
                  autoEnrollKeys.enable = true;
                };
              };
              boot.loader.efi.canTouchEfiVariables = true;
              environment.systemPackages = with pkgs; [
                sbctl
              ];
            };
        };
      plymouth.nixos = {
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
    };
  };
}
