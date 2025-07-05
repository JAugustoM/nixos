{ config, lib, pkgs, ...}:
{
  programs.lazygit = {
    enable = true;
    settings = {
      os.edit = "nvim {{filename}}";
    };
  };
}
