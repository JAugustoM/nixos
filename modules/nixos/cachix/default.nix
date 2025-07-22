{
  config,
  lib,
  pkgs,
  ...
}:
let
  types = lib.types;
  moduleName = "cachix";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable cachix";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cachix
    ];

    nix.settings = {
      substituters = [
        "https://install.determinate.systems"
        "https://nix-community.cachix.org"
        "https://devenv.cachix.org"
      ];
      trusted-public-keys = [
        "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
    };
  };
}
