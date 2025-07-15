{ 
  pkgs,
  ... 
}:
let
  catppuccin-kde = pkgs.catppuccin-kde.override {
    flavour = [ "mocha" ];
    accents = [ "sapphire" ];
    winDecStyles = [ "classic" ];
  };
in
{
  imports = [
    ./conf/bash.nix
    ./conf/beets.nix
    ./conf/direnv.nix
    ./conf/distrobox.nix
    ./conf/eza.nix
    ./conf/fish.nix
    ./conf/freetube.nix
    ./conf/kitty.nix
    ./conf/lazygit.nix
    ./conf/neovim.nix
    ./conf/obsidian.nix
    ./conf/starship.nix
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
      catppuccin-kde
      deadnix
      dualsensectl
      gdu
      imagemagick
      kew
      nixd
      nodejs
      ocrmypdf
      pika-backup
      poppler
      resvg
      rustlings
      scrcpy
      statix
      stremio
      tealdeer
      uv
      wl-clipboard
      youtube-music
      zapzap
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
    bat.enable = true;
    bottom.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    fzf.enable = true;
    gh.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };
}
