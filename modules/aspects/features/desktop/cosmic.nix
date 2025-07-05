{ den, ... }:
{
  den.aspects.desktop.cosmic = {
    includes = [ den.aspects.desktop.default ];
    nixos = { pkgs, ... }: {
      services.desktopManager.cosmic.enable = true;

      environment.cosmic.excludePackages = with pkgs; [
        cosmic-store
        cosmic-term
      ];
    };
  };
}
