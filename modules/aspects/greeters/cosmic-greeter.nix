{ ... }:
{
  den.aspects.greeters.cosmic-greeter = {
    nixos = {
      services.displayManager.cosmic-greeter.enable = true;
    };
  };
}
