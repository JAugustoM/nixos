{
  den.aspects.greeters.regreet = {
    nixos =
      { pkgs, ... }:
      {
        services = {
          displayManager.regreet.enable = true;
          greetd = {
            enable = true;
            settings = {
              default_session = {
                command = "${pkgs.cage}/bin/cage -s -- ${pkgs.regreet}/bin/regreet";
              };
            };
          };
        };
      };
  };
}
