{ den, ... }:
{
  den.aspects.editors = {
    includes = with den.aspects.editors; [
      helix
      # nvf
      # lazyvim
      vscode
      # zed
    ];

    homeManager = {
      home.sessionVariables = {
        EDITOR = "hx";
        VISUAL = "hx";
      };

      xdg.configFile.codebook = {
        target = "codebook/codebook.toml";
        text = ''
          dictionaries = ["en_us", "pt_br"]
        '';
      };
    };
  };
}
