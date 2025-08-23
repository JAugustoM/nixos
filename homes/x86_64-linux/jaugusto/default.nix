{ ... }:
{
  imports = [
    ./conf/bash.nix
    ./conf/beets.nix
    ./conf/direnv.nix
    ./conf/distrobox.nix
    ./conf/eza.nix
    ./conf/fish.nix
    ./conf/freetube.nix
    ./conf/git.nix
    ./conf/helix.nix
    ./conf/kitty.nix
    ./conf/lazygit.nix
    ./conf/nushell.nix
    ./conf/starship.nix
    ./conf/vscode.nix
    ./conf/yazi.nix
    ./conf/yt-dlp.nix
    ./conf/zellij.nix
    ./packages/communication.nix
    ./packages/customization.nix
    ./packages/development.nix
    ./packages/media.nix
    ./packages/tools.nix
  ];

  modules = {
    catppuccin.enable = true;
    plasma-manager.enable = true;
  };

  home = {
    stateVersion = "25.05";

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
    carapace.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    fzf.enable = true;
    gh.enable = true;
    jq.enable = true;
    mangohud.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };
}
