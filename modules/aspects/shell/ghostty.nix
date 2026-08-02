{ ... }:
{
  den.aspects.shell.ghostty = {
    homeManager = {
      programs.ghostty = {
        enable = true;
        enableFishIntegration = true;
      };
    };
  };
}
