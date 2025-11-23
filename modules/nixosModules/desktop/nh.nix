{ moduleWithSystem, ... }:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ ... }:
    {
      programs.nh = {
        enable = true;
        clean = {
          enable = true;
          extraArgs = "--keep 5";
        };
      };
    }
  );
}
