{ moduleWithSystem, ... }:
{
  flake.modules.nixos.pluto = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      catppuccin = {
        enable = true;
        flavor = "mocha";
        accent = "sapphire";

        cache.enable = true;

        sddm.enable = false;
      };
    }
  );
}
