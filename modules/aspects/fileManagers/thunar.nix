{
  den.aspects.fileManagers.thunar = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          kdePackages.ark
        ];

        programs.thunar = {
          enable = true;
          plugins = with pkgs; [
            thunar-archive-plugin
            thunar-vcs-plugin
            thunar-volman
          ];
        };

        services = {
          gvfs.enable = true;
          tumbler.enable = true;
        };
      };
  };
}
