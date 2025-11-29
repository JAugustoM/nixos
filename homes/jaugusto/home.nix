{ lib, ... }:
let
  mkIncludeList = path: files: lib.lists.forEach files (file: ./. + "/${path}/${file}.nix");
  configuration = mkIncludeList "conf" [
    "direnv"
    "eza"
    "fish"
    "git"
    "helix"
    "keepassxc"
    "kitty"
    "nushell"
    "starship"
    "yazi"
    "yt-dlp"
    "zed-editor"
    "zsh"
  ];

  packages = mkIncludeList "packages" [
    "development"
    "gui"
    "tools"
  ];
in
{
  imports = configuration ++ packages;

  home = {
    username = "jaugusto";
    homeDirectory = "/home/jaugusto";

    sessionPath = [
      "/home/jaugusto/.local/bin/"
      "/home/jaugusto/bin/"
      "/home/jaugusto/.cargo/bin/"
    ];

    stateVersion = "25.11";
  };

  xdg.autostart.enable = true;

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
