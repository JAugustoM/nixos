{
  den.aspects.nvidia = {
    nixos = {
      services.xserver.videoDrivers = [
        "nvidia"
      ];

      # nixpkgs.config.cudaSupport = true;

      hardware.nvidia = {
        open = true;
        modesetting.enable = true;

        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };

          intelBusId = "PCI:0@0:2:0";
          nvidiaBusId = "PCI:1@0:0:0";
        };
      };
    };
  };
}
