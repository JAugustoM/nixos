{ config, lib, pkgs, ...}:
{
  programs.obsidian = {
    enable = true;
    vaults = {
      Jumpchain = {
        target = "Documents/Obsidian/Jumpchain";
      };
    };
  };
}
