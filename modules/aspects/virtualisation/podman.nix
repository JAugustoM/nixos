{
  den.aspects.virtualisation.podman =
    { user, ... }:
    {
      nixos = {
        virtualisation = {
          containers.enable = true;
          podman.enable = true;
        };
        users.users.${user.name}.extraGroups = [
          "podman"
        ];
      };
    };
}
