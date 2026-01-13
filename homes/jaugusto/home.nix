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
    "starship"
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

  requiredDirs = [ "Cloud/Mega" ];
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
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    activation = {
      RequiredDirs =
        with builtins;
        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          ${concatStringsSep "\n" (map (dir: "run mkdir -p ~/${dir}") requiredDirs)}
        '';
    };

    stateVersion = "25.11";
  };

  xdg.autostart.enable = true;

  stylix = {
    targets.gtk.flatpakSupport.enable = false;
    targets.zen-browser.profileNames = [ "default" ];
  };

  modules = {
    zed-editor.enable = true;
    zen-browser.enable = true;

    niri = {
      enable = true;
      shell = "dms";
    };
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
