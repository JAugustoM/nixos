{
  den.aspects.virtualisation.docker =
    { user, ... }:
    {
      nixos =
        { pkgs, ... }:
        {
          virtualisation.docker = {
            enable = true;
            storageDriver = "btrfs";
          };
          users.users.${user.name}.extraGroups = [
            "docker"
          ];
          environment.systemPackages = [ pkgs.docker-compose ];
        };
    };
}
