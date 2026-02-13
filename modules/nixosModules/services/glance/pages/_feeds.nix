let
  inherit (builtins) map;
  feeds = [
    {
      url = "https://feeds.arstechnica.com/arstechnica/index";
      title = "Ars Technica";
    }
    {
      url = "https://itsfoss.com/rss/";
      title = "It's FOSS";
    }
    {
      url = "https://www.phoronix.com/rss.php";
      title = "Phoronix";
    }
  ];
in
{
  name = "Feeds";
  slug = "feeds";
  columns = [
    {
      size = "full";
      widgets = [
        {
          type = "group";
          widgets = map (
            { url, title }:
            {
              type = "rss";
              cache = "30m";
              inherit title;
              style = "detailed-list";
              feeds = [ { inherit url title; } ];
            }
          ) feeds;
        }
      ];
    }
    {
      size = "small";
      widgets = [
        {
          type = "releases";
          cache = "30m";
          token = "\${GITHUB_TOKEN}";
          show-source-icon = true;
          repositories = [
            "AppFlowy-IO/AppFlowy"
            "AvengeMedia/DankMaterialShell"
            "cachix/devenv"
            "fish-shell/fish-shell"
            "glanceapp/glance"
            "helix-editor/helix"
            "kovidgoyal/kitty"
            "YaLTer/niri"
            "nushell/nushell"
            "TibixDev/winboat"
            "zed-industries/zed"
          ];
        }
      ];
    }
  ];
}
