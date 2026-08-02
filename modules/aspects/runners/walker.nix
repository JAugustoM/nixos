{ ... }:
{
  den.aspects.runners.walker = {
    homeManager = {
      services = {
        elephant.enable = true;

        walker = {
          enable = true;
          systemd.enable = true;
        };
      };
    };
  };
}
