{
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ pkgs, ... }:
    {
      boot = {
        initrd.systemd.enable = true;

        tmp = {
          useTmpfs = true;
          tmpfsSize = "50%";
        };

        kernelPackages = pkgs.linuxPackages_cachyos;
      };
    }
  );
}
