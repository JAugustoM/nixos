{ config, lib, pkgs, ... }:
{
  programs.yt-dlp = {
    enable = true;
    settings = {
      quiet = true;
      color = "always";
      yes-playlist = true;
      concurrent-fragments = 3;
      downloader = "aria2c";
      paths = ''"~/Downloads/.Music/"'';
      output = ''"%(album_artist,uploader)s/%(album)s/%(track)s.%(ext)s"'';
      no-write-comments = true;
      progress = true;
      extract-audio = true;
      audio-format = "opus";
      audio-quality = 0;
      add-metadata = true;
    };
    extraConfig = ''
      --parse-metadata "%(track_number,playlist_autonumber)s:%(track_number)s" 
      --parse-metadata "%(album_artist,uploader)s:%(album_artist)s"
    '';
  };
}
