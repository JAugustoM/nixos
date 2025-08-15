{ ... }:
{
  programs.zsh = {
    enable = true;
    enableVteIntegration = true;
    autocd = true;

    antidote = {
      enable = true;
      useFriendlyNames = true;
      plugins = [
        # Oh-My-Zsh
        "getantidote/use-omz"
        "ohmyzsh/ohmyzsh path:lib"
        "ohmyzsh/ohmyzsh path:plugins/aliases"
        "ohmyzsh/ohmyzsh path:plugins/alias-finder"
        "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
        "ohmyzsh/ohmyzsh path:plugins/copybuffer"
        "ohmyzsh/ohmyzsh path:plugins/dirhistory"
        "ohmyzsh/ohmyzsh path:plugins/dotenv"
        "ohmyzsh/ohmyzsh path:plugins/fancy-ctrl-z"

        "mattmc3/ez-compinit"
        "zsh-users/zsh-completions kind:fpath path:src"
        "aloxaf/fzf-tab"
        "belak/zsh-utils path:completion/functions kind:autoload post:compstyle_zshzoo_setup"
        "belak/zsh-utils path:editor"
        "belak/zsh-utils path:history"
        "belak/zsh-utils path:utility"
        "zdharma-continuum/fast-syntax-highlighting"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-history-substring-search"
      ];
    };
  };
}
