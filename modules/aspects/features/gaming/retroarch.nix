{ ... }:
{
  den.aspects.gaming.retroarch = {
    homeManager = {
      programs.retroarch = {
        enable = true;
        cores = {
          desmume.enable = true;
          mgba.enable = true;
        };
      };
    };
  };
}
