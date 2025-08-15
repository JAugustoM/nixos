{ pkgs, ... }:
let
  catppuccin-kde = pkgs.catppuccin-kde.override {
    flavour = [ "mocha" ];
    accents = [ "sapphire" ];
    winDecStyles = [ "classic" ];
  };
in
{
  home.packages = with pkgs; [
    catppuccin-cursors.mochaDark
    catppuccin-kde
  ];
}
