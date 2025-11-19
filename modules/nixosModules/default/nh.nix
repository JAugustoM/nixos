{ ... }:
{
  flake.modules.nixos.default = {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 5";
      };
    };
  };
}
