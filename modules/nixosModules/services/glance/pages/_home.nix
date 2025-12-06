{
  name = "Home";
  slug = "";
  center-vertically = true;
  head-widgets = [
    {
      type = "search";
      search-engine = "duckduckgo";
      hide-header = true;
      bangs = [
        {
          title = "NixOS Packages";
          shortcut = "@np";
          url = "https://search.nixos.org/packages?channel=unstable&query={QUERY}";
        }
        {
          title = "NixOS Options";
          shortcut = "@no";
          url = "https://search.nixos.org/options?channel=unstable&query={QUERY}";
        }
        {
          title = "NixOS Wiki";
          shortcut = "@nw";
          url = "https://wiki.nixos.org/w/index.php?search={QUERY}";
        }
      ];
    }
  ];
  columns = [
    {
      size = "full";
      widgets = [
        {
          type = "server-stats";
          servers = [
            {
              type = "local";
              name = "Laptop";
              hide-swap = true;
            }
          ];
        }
        {
          type = "to-do";
        }
      ];
    }
    {
      size = "small";
      widgets = [
        {
          type = "weather";
          hide-header = true;
          location = "Brasília";
          hour-format = "24h";
        }
        {
          type = "calendar";
          hide-header = true;
          first-day-of-week = "sunday";
        }
      ];
    }
  ];
}
