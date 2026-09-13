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

    nixos = {
      environment.variables = {
        EDITOR = "hx";
        VISUAL = "hx";
      };
    };

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
