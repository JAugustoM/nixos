{ ... }:
{
  flake.overlays.ffmpeg-full = final: prev: {
    ffmpeg-full = (prev.ffmpeg-full.override { withUnfree = true; }).overrideAttrs (_: {
      doCheck = false;
    });
  };
}
