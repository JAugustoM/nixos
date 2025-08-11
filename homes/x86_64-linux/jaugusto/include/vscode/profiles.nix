{
  pkgs,
  ...
}:
let
  defaultSettings = {
    "cSpell.language" = "en,pt,pt_BR";
    "editor.fontFamily" = "'Adwaita Mono', 'Droid Sans Mono', 'monospace', monospace";
    "editor.fontLigatures" = true;
    "editor.formatOnSave" = true;
    "terminal.integrated.defaultProfile.linux" = "fish";
    "direnv.restart.automatic" = true;
    "ltex.language" = "pt-BR";
    "ltex.languageToolHttpServerUri" = "http://localhost:8081/";
  };
  # defaultExtensios = pkgs.nix4vscode.forVscode [
  #   "aaron-bond.better-comments"
  #   "christian-kohler.path-intellisense"
  #   "DavidAnson.vscode-markdownlint"
  #   "IBM.output-colorizer"
  #   "mkhl.direnv"
  #   "streetsidesoftware.code-spell-checker"
  #   "streetsidesoftware.code-spell-checker-portuguese-brazilian"
  #   "usernamehw.errorlens"
  #   "yzhang.markdown-all-in-one"
  # ];
in
{
  default = {
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    userSettings = defaultSettings;
    extensions = defaultExtensios;
  };

  Rust = {
    userSettings = defaultSettings;

    # extensions =
    #   defaultExtensios
    #   ++ pkgs.nix4vscode.forVscode [
    #     "fill-labs.dependi"
    #     "rust-lang.rust-analyzer"
    #     "tamasfe.even-better-toml"
    #     "vadimcn.vscode-lldb"
    #   ];
  };

  Web = {
    userSettings = defaultSettings;

    # extensions =
    #   defaultExtensios
    #   ++ pkgs.nix4vscode.forVscode [
    #     "christian-kohler.npm-intellisense"
    #     "esbenp.prettier-vscode"
    #     "xabikos.JavaScriptSnippets"
    #     "yandeu.five-server"
    #     "yoavbls.pretty-ts-errors"
    #   ];
  };
}
