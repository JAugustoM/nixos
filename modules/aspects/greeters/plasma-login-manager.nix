{ ... }:
{
  den.aspects.greeters.plasma-login-manager = {
    nixos = {
      services.displayManager.plasma-login-manager.enable = true;
    };
  };
}
