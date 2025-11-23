{ moduleWithSystem, ... }:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      hardware = {
        enableRedistributableFirmware = true;
      };
    }
  );
}
