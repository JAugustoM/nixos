{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    bun
    dualsensectl
    imagemagick
    kew
    nodejs
    poppler
    resvg
    scrcpy
    tldr
    uv
    wl-clipboard
    youtube-music
  ];

  programs = {
    bash.enable = true;
    bat.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    fzf.enable = true;
    gh.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };

  imports = [
    ./programs/beets.nix
    ./programs/direnv.nix
    ./programs/eza.nix
    ./programs/fish.nix
    ./programs/kitty.nix
    ./programs/lazygit.nix
    ./programs/neovim.nix
    ./programs/obsidian.nix
    ./programs/omp.nix
    ./programs/yazi.nix
    ./programs/yt-dlp.nix
    ./programs/zellij.nix
  ];
}
