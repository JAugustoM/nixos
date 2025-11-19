{ moduleWithSystem, ... }:
{
  flake.modules.nixos.desktop = moduleWithSystem (
    perSystem@{ pkgs, ... }:
    nixos@{ ... }:
    {
      environment.systemPackages = with pkgs; [
        libreoffice-qt6-fresh
        hunspell
        hunspellDicts.en_US
        hunspellDicts.pt_BR
      ];
    }
  );
}
