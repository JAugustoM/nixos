{ 
  config,
  lib,
  options,
  namespace,
  pkgs,
  ... 
}:
{
  imports = [
    ./conf/beets.nix
    ./conf/direnv.nix
    ./conf/eza.nix
    ./conf/fish.nix
    ./conf/kitty.nix
    ./conf/lazygit.nix
    ./conf/neovim.nix
    ./conf/obsidian.nix
    ./conf/omp.nix
    ./conf/yazi.nix
    ./conf/yt-dlp.nix
    ./conf/zellij.nix
  ];

  modules = {
    catppuccin.enable = true;
    plasma-manager.enable = true;
  };

  home = {
    stateVersion = "25.05"; 

    packages = with pkgs; [
      adwaita-fonts
      aria2
      bun
      catppuccin-cursors.mochaDark
      (catppuccin-kde.override { flavour = [ "mocha" ]; accents = [ "sapphire" ]; winDecStyles = [ "classic" ]; })
      dualsensectl
      eloquent
      imagemagick
      kew
      nodejs
      pika-backup
      poppler
      resvg
      scrcpy
      stremio
      tealdeer
      uv
      wl-clipboard
      youtube-music
    ];

    sessionPath = [
      "$HOME/.local/bin/"
      "$HOME/bin/"
      "$HOME/.bun/bin/"
      "$HOME/.cargo/bin/"
    ];

    sessionVariables = {
      LANGUAGE = "en_US";
    };
  };

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
}
