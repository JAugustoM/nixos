{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "sound";
  cfg = config.modules.${moduleName};
in
{
  options = { };
  config = {
    services.pulseaudio.enable = lib.mkDefault false;
    security.rtkit.enable = lib.mkDefault true;
    services.pipewire = lib.mkDefault {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
