{ inputs, lib, ... }:
let
  mkIncludeList = folder: files: lib.lists.forEach files (file: ./. + "/${folder}/${file}.nix");
  configuration = mkIncludeList "conf" [
    "direnv"
    "eza"
    "fish"
    "git"
    "kitty"
    "nushell"
    "yazi"
    "yt-dlp"
    "zsh"
  ];

  packages = mkIncludeList "packages" [
    "development"
    "gui"
    "tools"
  ];

  internalModules = with inputs.self.modules.homeManager; [
    jaugusto
  ];

  externalModules = with inputs; [
    nix-index-database.homeModules.nix-index
  ];
in
{
  imports = configuration ++ packages ++ externalModules ++ internalModules;

  home = {
    username = "jaugusto";
    homeDirectory = "/home/jaugusto";

    sessionPath = [
      "/home/jaugusto/.local/bin/"
      "/home/jaugusto/bin/"
      "/home/jaugusto/.cargo/bin/"
    ];

    sessionVariables = {
      CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense";
      EDITOR = "hx";
      LANGUAGE = "en_US";
      VISUAL = "hx";
    };

    stateVersion = "25.11";
  };

  xdg.autostart.enable = true;

  modules = {
    borgmatic.enable = true;
    helix.enable = true;
    vicinae.enable = true;
    zed-editor.enable = true;
    zen-browser.enable = true;
  };

  programs = {
    bat.enable = true;
    btop.enable = true;
    carapace.enable = true;
    distrobox.enable = true;
    fastfetch.enable = true;
    fzf.enable = true;
    gitui.enable = true;
    mangohud.enable = true;
    nix-index.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };
}
