{ ... }:
{
  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        sort_by = "natural";
        sort_dir_first = true;
        show_symlink = true;
      };
      opener = {
        edit = [
          { run = ''$EDITOR "$@"''; block = true; for = "unix"; }
        ];
      };
    };
    shellWrapperName = "y";
  };
}
