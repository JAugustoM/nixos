{ ... }:
{
  den.aspects.shell.herdr = { user, ... }: {
    homeManager = {
      programs = {
        herdr = {
          enable = true;
          settings = fromTOML ''
            onboarding = false

            [keys]    
            prefix = "ctrl+s"

            [[keys.command]]
            command = "lazygit"
            description = "Open lazygit"
            key = "ctrl+g"
            type = "pane"

            [[keys.command]]
            command = "hx"
            description = "Open helix"
            key = "ctrl+e"
            type = "pane"

            [terminal]
            default_shell = "fish"

            [theme]
            name = "${user.theme}"
            auto_switch = true

            [ui]
            hide_tab_bar_when_single_tab = true
            sidebar_start_collapsed = true
          '';
        };

        fish.interactiveShellInit = ''
          if not set -q HERDR_ENV
            exec herdr
          end
        '';
      };
    };
  };
}
