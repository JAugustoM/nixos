[
  {
    location = "bottom";
    widgets = [
      {
        kickoff = {
          icon = "nix-snowflake";
          showButtonsFor = {
            custom = [
              "suspend"
              "hibernate"
              "reboot"
              "shutdown"
            ];
          };
          showActionButtonCaptions = true;
        };
      }
      {
        iconTasks = {
          launchers = [
            "preferred://browser"
            "preferred://filemanager"
          ];
          appearance = {
            showTooltips = true;
            highlightWindows = false;
            indicateAudioStreams = true;
            fill = true;
            iconSpacing = "medium";
          };
        };
      }
      "org.kde.plasma.marginsseparator"
      {
        systemTray.icons = {
          spacing = "medium";
        };
      }
      {
        digitalClock = {
          date = {
            enable = true;
            format = "shortDate";
            position = "adaptive";
          };
          time = {
            showSeconds = "onlyInTooltip";
            format = "24h";
          };
          calendar = {
            firstDayOfWeek = "sunday";
            plugins = [ "holidaysevents" ];
          };
        };
      }
      "org.kde.plasma.showdesktop"
    ];
  }
]
