{
  den.aspects.cachyos = {
    nixos = { pkgs, ... }: {
      boot.kernelPackages = pkgs.linuxPackages_cachyos;
      hardware.nvidia.package = pkgs.nvidia_cachyos;
    };
  };
}
