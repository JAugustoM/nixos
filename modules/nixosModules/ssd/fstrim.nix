{ moduleWithSystem, ... }:
{
  flake.modules.nixos.ssd = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      services.fstrim.enable = true;
    }
  );
}
