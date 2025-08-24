{ ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/jaugusto/.config/nixos";
    clean = {
      enable = true;
      extraArgs = "--keep 5";
    };
  };
}
