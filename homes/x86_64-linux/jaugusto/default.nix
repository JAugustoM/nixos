{ ... }:
{
  imports = [
    ./conf/bash.nix
    ./conf/beets.nix
    ./conf/carapace.nix
    ./conf/direnv.nix
    ./conf/distrobox.nix
    ./conf/eza.nix
    ./conf/fish.nix
    ./conf/freetube.nix
    ./conf/helix.nix
    ./conf/kitty.nix
    ./conf/lazygit.nix
    ./conf/nushell.nix
    ./conf/obsidian.nix
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
      NIXOS_OZONE_WL = "1";
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
    mangohud.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };
}
