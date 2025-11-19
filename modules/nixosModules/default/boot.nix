{
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ pkgs, ... }:
    nixos@{ ... }:
    {
      boot = {
        initrd.systemd.enable = true;

        tmp = {
          useTmpfs = true;
          tmpfsSize = "50%";
        };

        kernelPackages = pkgs.linuxPackages_latest;
      };
    }
  );
}
