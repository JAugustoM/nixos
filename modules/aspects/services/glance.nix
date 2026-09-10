{ den, ... }:
let
  rssFeed =
    { url, title }:
    ''{ type = "rss", title = "${title}", style = "detailed-list", feeds = [ { url = "${url}" } ] }'';
in
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
            base-url = "/glance"

            [[pages]]
            name = "Home"

            [[pages.head-widgets]]
            type = "search"
            hide-header = true
            new-tab = true
            bangs = [
              { title = "YouTube", shortcut = "!yt", url = "https://www.youtube.com/results?search_query={QUERY}" },
              { title = "Nix Packages", shortcut = "!np", url = "https://search.nixos.org/packages?channel=unstable&query={QUERY}" },
              { title = "Nix Options", shortcut = "!no", url = "https://search.nixos.org/options?channel=unstable&query={QUERY}" }
            ]

            [[pages.columns]]
            size = "full"

            [[pages.columns.widgets]]
            type = "group"
            widgets = [
              ${
                rssFeed {
                  url = "https://feed.itsfoss.com/";
                  title = "It's FOSS";
                }
              },
              ${
                rssFeed {
                  url = "https://www.phoronix.com/rss.php";
                  title = "Phoronix";
                }
              },
              ${rssFeed {
                url = "https://feeds.arstechnica.com/arstechnica/index";
                title = "Ars Technica";
              }}
            ]


            [[pages.columns]]
            size = "small"

            [[pages.columns.widgets]]
            type = "releases"
            repositories = [
              "AvengeMedia/DankMaterialShell",
              "cachix/devenv",
              "fish-shell/fish-shell",
              "kovidgoyal/kitty",
              "lapce/lapce",
              "marc2332/freya",
              "noctalia-dev/noctalia",
              "noctalia-dev/umbriel",
              "nushell/nushell",
              "pop-os/cosmic-epoch",
              "winboat-org/winboat"
            ]
          '';
        };

        caddy.virtualHosts."${domain}" = {
          extraConfig = ''
            handle_path /glance* {              
              reverse_proxy 127.0.0.1:8080
            }
          '';
        };
      };
    };
}
