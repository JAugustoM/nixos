{ moduleWithSystem, ... }:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      hardware = {
        # enableRedistributableFirmware = true;
      };
    }
  );
}
