{ den, ... }:
{
  den.aspects.virtualisation.default = {
    includes = [
      den.aspects.virtualisation.docker
      den.aspects.virtualisation.podman
    ];
  };
}
