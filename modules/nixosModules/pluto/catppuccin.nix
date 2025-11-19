{ ... }:
{
  flake.modules.nixos.pluto = {
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "sapphire";

      cache.enable = true;

      sddm.enable = false;
    };
  };
}
