{ ... }:
{
  programs.starship = {
    enable = true;
    enableInteractive = true;
    enableTransience = true;
    settings = builtins.fromTOML (builtins.readFile ../include/starship/jetpack.toml);
  };
}
