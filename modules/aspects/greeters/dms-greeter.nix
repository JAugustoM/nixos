{
  den.aspects.greeters.dms-greeter = { user, ... }: {
    nixos = {
      services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "niri";
        configHome = "/home/${user.userName}";
      };
    };
  };
}
