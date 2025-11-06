{ host, ... }:
{
  imports = [
    ./conf/catppuccin.nix
    ./conf/direnv.nix
    ./conf/eza.nix
    ./conf/fish.nix
    ./conf/git.nix
    ./conf/helix.nix
    ./conf/kitty.nix
    ./conf/nushell.nix
    ./conf/starship.nix
    ./conf/vscode.nix
    ./conf/yazi.nix
    ./conf/yt-dlp.nix
    ./conf/zed-editor.nix
    ./conf/zsh.nix
    ./packages/development.nix
    ./packages/gui.nix
    ./packages/lsp.nix
    ./packages/tools.nix
  ];

  home = {
    stateVersion = "25.05";

    sessionPath = [
      "/home/jaugusto/.local/bin/"
      "/home/jaugusto/bin/"
      "/home/jaugusto/.cargo/bin/"
    ];
  };

  programs = {
    bat.enable = true;
    btop.enable = true;
    carapace.enable = true;
    distrobox.enable = true;
    fastfetch.enable = true;
    fzf.enable = true;
    gh.enable = true;
    gitui.enable = true;
    mangohud.enable = true;
    nix-index.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };
}
