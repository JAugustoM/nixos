{ ... }:
{
  den.aspects.shell.zellij = {
    homeManager = {
      programs.zellij = {
        enable = true;
        exitShellOnExit = true;

        enableFishIntegration = true;

        extraConfig = ''
          keybinds {
              shared_except "locked" {
                  bind "Ctrl e" { 
                      Run "nvim" { 
                          floating true; 
                          close_on_exit true; 
                      }; 
                  }
              }
          }
        '';
      };
    };
  };
}
