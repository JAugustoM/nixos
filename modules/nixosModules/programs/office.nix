{ lib, moduleWithSystem, ... }:
{
  flake.modules.nixos.programs = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ pkgs, config, ... }:
    let
      cfg = config.modules.programs.office;
    in
    {
      options.modules.programs.office.enable = lib.mkEnableOption "Enable office programs";

      config = lib.mkIf (cfg.enable) {
        environment.systemPackages = with pkgs; [
          libreoffice-qt6-fresh
          hunspell
          hunspellDicts.en_US
          hunspellDicts.pt_BR
        ];
      };
    }
  );
}
