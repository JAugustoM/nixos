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
    "git.autofetch" = true;
    "terminal.integrated.defaultProfile.linux" = "fish";
    "direnv.restart.automatic" = true;
    "ltex.language" = "pt-BR";
    "ltex.languageToolHttpServerUri" = "http://localhost:8081/";
  };
  defaultExtensios = pkgs.nix4vscode.forOpenVsx [
    "aaron-bond.better-comments"
    "christian-kohler.path-intellisense"
    "genuitecllc.codetogether"
    "IBM.output-colorizer"
    "jnoortheen.nix-ide"
    "mkhl.direnv"
    "nefrob.vscode-just-syntax"
    "streetsidesoftware.code-spell-checker"
    "streetsidesoftware.code-spell-checker-portuguese-brazilian"
    "usernamehw.errorlens"
    "yzhang.markdown-all-in-one"
  ];
in
{
  default = {
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    userSettings = defaultSettings;
    extensions = defaultExtensios;
    keybindings = import ../../include/vscode/keybindings.nix;
  };

  Bison = {
    userSettings = defaultSettings;

    extensions =
      defaultExtensios
      ++ pkgs.nix4vscode.forOpenVsx [
        "ms-vscode.cmake-tools"
        "llvm-vs-code-extensions.vscode-clangd"
      ]
      ++ pkgs.nix4vscode.forVscode [
        "daohong-emilio.yash"
      ];
  };

  Rust = {
    userSettings = defaultSettings;

    extensions =
      defaultExtensios
      ++ pkgs.nix4vscode.forOpenVsx [
        "fill-labs.dependi"
        "rust-lang.rust-analyzer"
        "tamasfe.even-better-toml"
        "vadimcn.vscode-lldb"
      ];
  };

  Web = {
    userSettings = defaultSettings;

    extensions =
      defaultExtensios
      ++ pkgs.nix4vscode.forOpenVsx [
        "christian-kohler.npm-intellisense"
        "esbenp.prettier-vscode"
        "xabikos.JavaScriptSnippets"
        "yandeu.five-server"
        "yoavbls.pretty-ts-errors"
      ];
  };
}
