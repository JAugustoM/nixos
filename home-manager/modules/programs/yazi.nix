{ config, lib, pkgs, ... }:
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
          { run = "nvim $0"; block = true; for = "unix"; }
        ];
      };
    };
    shellWrapperName = "y";
  };
}
