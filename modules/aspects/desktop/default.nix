{ den, inputs, ... }:
{
  flake-file.inputs = {
    nix-gaming.url = "github:fufexan/nix-gaming";
  };
  den.aspects.desktop.default = {
    nixos = {
      imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ];

      security.rtkit.enable = true;

      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings.General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };

      services = {
        printing.enable = true;
        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          jack.enable = true;
          lowLatency.enable = true;
        };
      };
    };
  };
}
