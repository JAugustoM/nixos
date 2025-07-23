{ config, lib, pkgs, ... }:
{
  programs.beets = {
    enable = true;
    settings = {
      ui.color = true;
      import = {
        move = true;
        resume = true;
        incremental = true;
        detail = true;
        group_albums = true;
        bell = true;
      };
      musicbrainz.genres = "yes";
      paths.default = "$albumartist/[$year]$atypes $album/$track $title";
      plugins = [
        "chroma"
        "fetchart"
        "embedart"
        "lyrics"
        "mbsync"
        "replaygain"
        "parentwork"
        "scrub"
        "albumtypes"
        "thumbnails"
        "lastgenre"
      ];
      fetchart = {
        quality = 75;
        enforce_ratio = true;
      };
      embedart.quality = 75;
      lyrics = {
        sources = ["lrclib" "genius" "tekstowo"];
        synced = true;
        force = true;
      };
      replaygain.backend = "ffmpeg";
      parentwork.auto = true;
      thumbnails.dolphin = true;
    };
  };
}
