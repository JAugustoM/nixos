{ den, ... }:
{
  den.aspects.services.glance =
    { host, ... }:
    let
      domain = "${host.hostName}.${host.tailnet}";
    in
    {
      includes = [
        den.aspects.services.caddy
        den.aspects.services.tailscale
      ];

      nixos.services = {
        glance = {
          enable = true;

          settings = fromTOML ''
            [server]    
            proxied = true

            [[pages]]
            name = "Home"

            [[pages.columns]]
            size = "full"

            [[pages.columns.widgets]]
            type = "search"
            hide-header = true
            new-tab = true
            bangs = [
              { title = "YouTube", shortcut = "!yt", url = "https://www.youtube.com/results?search_query={QUERY}" },
              { title = "Nix Packages", shortcut = "!np", url = "https://search.nixos.org/packages?channel=unstable&query={QUERY}" },
              { title = "Nix Options", shortcut = "!no", url = "https://search.nixos.org/options?channel=unstable&query={QUERY}" }
            ]

            [[pages.columns.widgets]]
            type = "group"
            widgets = [
              { type = "reddit", subreddit = "NixOS", show-thumbnails = true, show-flairs = true },
              { type = "reddit", subreddit = "gamingnews", show-thumbnails = true, show-flairs = true },
              { type = "reddit", subreddit = "hardware", show-thumbnails = true, show-flairs = true },
            ]

            [[pages]]
            name = "News"

            [[pages.columns]]
            size = "full"

            [[pages.columns.widgets]]
            type = "group"
            widgets = [
              { type = "rss", title = "It's FOSS", style = "detailed-list", feeds = [ { url = "https://feed.itsfoss.com/" } ] },
              { type = "rss", title = "Phoronix", style = "detailed-list", feeds = [ { url = "https://www.phoronix.com/rss.php" } ] },
              { type = "rss", title = "Ars Technica", style = "detailed-list", feeds = [ { url = "https://feeds.arstechnica.com/arstechnica/index" } ] },
              { type = "rss", title = "Ladybird", style = "detailed-list", feeds = [ { url = "https://ladybird.org/posts.rss" } ] }
            ]


            [[pages.columns]]
            size = "small"

            [[pages.columns.widgets]]
            type = "releases"
            repositories = [
              "pop-os/cosmic-epoch",
              "fish-shell/fish-shell",
              "kovidgoyal/kitty",
              "nushell/nushell"
            ]
          '';
        };

        caddy.virtualHosts."${domain}" = {
          extraConfig = ''
            reverse_proxy 127.0.0.1:8080
          '';
        };
      };
    };
}
