{
  den.aspects.shell.yt-dlp = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          aria2
          atomicparsley
          brotli
          deno
          python3Packages.certifi
          python3Packages.curl-cffi
          python3Packages.mutagen
          python3Packages.pycryptodome
          python3Packages.requests
          python3Packages.secretstorage
          python3Packages.yt-dlp-ejs
          python3Packages.websockets
        ];

        programs.yt-dlp = {
          enable = true;
          settings = {
            downloader = "aria2c";
            extract-audio = true;
            format = "bestaudio";
            audio-format = "opus";
            embed-metadata = true;
            output = "~/Downloads/%(channel)s/%(album)s/%(title)s.%(ext)s";
          };
        };
      };
  };
}
