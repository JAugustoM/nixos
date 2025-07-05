{
  den.aspects.shell.yazi = {
    homeManager =
      { pkgs, ... }:
      {
        programs.yazi = {
          enable = true;
          shellWrapperName = "y";
          extraPackages = with pkgs; [
            fd
            fzf
            imagemagick
            jq
            poppler
            resvg
            ripgrep
            wl-clipboard
            zoxide
          ];
          settings = {
            mgr = {
              sort_by = "natural";
              sort_dir_first = true;
              show_symlink = true;
            };
            opener = {
              edit = [
                {
                  run = ''$EDITOR "$@"'';
                  block = true;
                  for = "unix";
                }
              ];
            };
          };
        };
      };
  };
}
