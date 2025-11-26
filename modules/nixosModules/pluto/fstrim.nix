{ moduleWithSystem, ... }:
{
  flake.modules.nixos.pluto = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      services.fstrim.enable = true;
    }
  );
}
