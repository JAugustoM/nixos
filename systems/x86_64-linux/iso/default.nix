{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  modules.iso.isIso = true;

  environment.systemPackages = with pkgs; [
    git
    helix
    yazi
  ];

  snowfallorg.users.jaugusto = {
    create = false;
    home.enable = false;
  };
}
