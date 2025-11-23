{ moduleWithSystem, ... }:
{
  flake.modules.nixos.pluto = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      zramSwap = {
        enable = true;
        algorithm = "zstd";
        priority = 5;
        memoryPercent = 50;
      };
    }
  );
}
