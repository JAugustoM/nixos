{
  den.aspects.shell.beets = {
    homeManager = {
      programs.beets = {
        enable = true;
        settings = fromTOML ''
          plugins = ["scrub", "fetchart", "embedart", "inline", "replaygain", "lyrics", "lastgenre", "musicbrainz", "chroma"]

          [scrub]
          auto = true

          [fetchart]
          auto = true
          sources = ["coverart", "itunes", "amazon", "albumart"]
          cover_names = ["cover", "front"]

          [embedart]
          auto = true
          remove_art_file = true

          [item_fields]
          p_albumartist = "albumartist if albumartist else artist"
          p_disc = '("%02d-" % disc if disctotal > 9 else "%d-" % disc) if disctotal > 1 else ""'
          p_track = '("%02d " % track) if (albumartist and track > 0) else ""'
          p_multiartist = '(artist + " - ") if comp else ""'

          [paths]
          default = "$p_albumartist/%if{$albumartist,$album/}$p_disc$p_track$p_multiartist$title"
          singleton = "$p_albumartist/%if{$albumartist,$album/}$p_disc$p_track$p_multiartist$title"

          [replaygain]
          auto = true
          backend = "ffmpeg"

          [lyrics]
          auto = true
          synced = true
          fallback = ""

          [lastgenre]
          auto = true
          source = "album"    

          [chroma]
          auto = true
        '';
      };
    };
  };
}
