{
  den.aspects.greeters.dms-greeter = {
    nixos = {
      services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "niri";
        configHome = "/home/jaugusto";
      };
    };
  };
}
