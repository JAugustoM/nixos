{ ... }:
{
  flake.modules.nixos.default = {
    hardware = {
      enableRedistributableFirmware = true;
    };
  };
}
