{ moduleWithSystem, ... }:
{
  flake.modules.nixos.zram = moduleWithSystem (
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
