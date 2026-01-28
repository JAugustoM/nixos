{
  lib,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.modules.homeManager.jaugusto = moduleWithSystem (
    perSystem@{ ... }:
    home@{ config, pkgs, ... }:
    let
      cfg = config.modules.sops;
      user = config.home.username;
    in
    {
      programs.starship = {
        enable = true;
        enableInteractive = true;
        enableTransience = true;
        settings = fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/jetpack.toml");
      };
    }
  );
}
