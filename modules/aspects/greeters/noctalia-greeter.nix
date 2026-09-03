{
  den.aspects.greeters.noctalia-greeter = {
    nixos = { pkgs, ... }: {
      services.displayManager.noctalia-greeter = {
        enable = true;

        cursorTheme = {
          name = "Bibata-Modern-Ice";
          package = pkgs.bibata-cursors;
        };
      };
    };
  };
}
