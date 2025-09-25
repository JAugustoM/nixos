{ ... }:
{
  programs.ghostty = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;

    settings = {
      font-family = "Iosevka NF";
      font-size = 12;
      command = "fish";
      maximize = true;
      window-decoration = "none";

      keybind = [
        "ctrl+alt+h=goto_split:left"
        "ctrl+alt+l=goto_split:right"
        "ctrl+alt+j=goto_split:down"
        "ctrl+alt+k=goto_split:up"

        "alt+shift+h=new_split:left"
        "alt+shift+l=new_split:right"
        "alt+shift+j=new_split:down"
        "alt+shift+k=new_split:up"
      ];
    };
  };
}
