{ inputs, lib, ... }:
let
  mkIncludeList = path: files: lib.lists.forEach files (file: ./. + "/${path}/${file}.nix");
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
    "zed-editor"
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

  xdg = {
    autostart.enable = true;
    mimeApps = {
      enable = true;

      defaultApplications = {
        "text/html" = [ "zen.desktop" ];
        "x-scheme-handler/http" = [ "zen.desktop" ];
        "x-scheme-handler/https" = [ "zen.desktop" ];
        "x-scheme-handler/about" = [ "zen.desktop" ];
        "x-scheme-handler/unknown" = [ "zen.desktop" ];

        "inode/directory" = [ "org.kde.dolphin.desktop" ];

        "image/jpeg" = [ "org.kde.gwenview.desktop" ];
        "image/png" = [ "org.kde.gwenview.desktop" ];
        "image/gif" = [ "org.kde.gwenview.desktop" ];
        "image/svg+xml" = [ "org.kde.gwenview.desktop" ];

        "application/pdf" = [ "org.kde.okular.desktop" ];
        "text/plain" = [ "org.kde.kate.desktop" ];
      };

      associations.added = {
        "image/jpeg" = [ "zen.desktop" ];
        "application/pdf" = [ "zen.desktop" ];
      };
    };
  };

  stylix.targets.zen-browser.enable = false;

  modules.niri = {
    enable = true;
    shell = "noctalia";
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
