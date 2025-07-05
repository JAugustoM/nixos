{
  den.aspects.shell.nh =
    { user, ... }:
    {
      nixos = {
        programs.nh = {
          enable = true;
          flake = "/home/${user.name}/.config/nixos";
          clean = {
            enable = true;
            extraArgs = "--keep 5";
          };
        };
      };
    };
}
