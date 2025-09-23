{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  modules.iso.isIso = true;

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://install.determinate.systems"
        "https://chaotic-nyx.cachix.org/"
      ];
      trusted-public-keys = [
        "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      ];
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.systemPackages = with pkgs; [
    git
    helix
    yazi
  ];
}
