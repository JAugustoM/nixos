{ ... }:
{
  programs.zsh = {
    enable = true;
    enableVteIntegration = true;

    autocd = true;
    historySubstringSearch.enable = true;

    autosuggestion = {
      enable = true;
      strategy = [ "match_prev_cmd" ];
    };

    shellAliases = {
      build-iso = ''nom build "$NH_FLAKE"#install-isoConfigurations.terra'';
      check-flake = ''nix repl --expr "builtins.getFlake (builtins.toString $NH_FLAKE)"'';
      flakeup = "nix flake update --flake $NH_FLAKE";
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
      ];
    };

    zsh-abbr = {
      enable = true;

      abbreviations = {
        nob = "nh os boot";
        nos = "nh os switch";
        nca = "nh clean all --keep 5";
      };
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "aliases"
        "colored-man-pages"
        "copypath"
        "copyfile"
        "dirhistory"
        "fancy-ctrl-z"
        "gitignore"
        "man"
        "per-directory-history"
        "rust"
        "sudo"
        "tldr"
        "zsh-interactive-cd"
      ];
    };
  };
}
