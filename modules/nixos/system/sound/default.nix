{
  config,
  lib,
  virtual,
  ...
}:
let
  types = lib.types;
  moduleName = "sound";
  cfg = config.modules.${moduleName};
in
{
  options = { };
  config = lib.mkIf (!virtual) {
    services.pulseaudio.enable = lib.mkDefault false;
    security.rtkit.enable = lib.mkDefault true;
    services.pipewire = lib.mkDefault {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;

      lowLatency.enable = true;
    };
  };
}
