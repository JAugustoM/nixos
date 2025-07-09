{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    extraPackages = with pkgs; [
      jq
      poppler
      fd
      ripgrep
      resvg
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
}
