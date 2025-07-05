{
  den.aspects.shell.starship = {
    homeManager =
      { pkgs, ... }:
      {
        programs.starship = {
          enable = true;
          enableInteractive = true;
          enableTransience = true;
          settings = fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/jetpack.toml");
        };
      };
  };
}
