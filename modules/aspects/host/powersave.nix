{
  den.aspects.powersave = {
    nixos = {
      services = {
        thermald.enable = true;
        upower.enable = true;
      };
    };
  };
}
