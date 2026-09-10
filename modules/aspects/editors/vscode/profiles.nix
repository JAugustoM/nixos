{ ... }:
{
  den.aspects.editors.vscode = {
    homeManager = { pkgs, ... }: {
      stylix.targets.vscodium.profileNames = [
        "default"
        "Flutter"
        "Python"
        "Rust"
      ];

      programs.vscodium.profiles =
        let
          defaultSettings = {
            "cSpell.language" = "en,pt,pt_BR";
            "cSpell.enabledFileTypes" = {
              "nix" = false;
            };

            "dev.containers.dockerPath" = "podman";

            "editor.formatOnSave" = true;

            "extensions.ignoreRecommendations" = true;

            "files.exclude" = {
              "**/.devenv/" = true;
              "**/.direnv/" = true;
            };

            "git.autofetch" = true;

            "nix.enableLanguageServer" = true;
            "nix.serverPath" = "${pkgs.nixd}/bin/nixd";

            "terminal.integrated.defaultProfile.linux" = "fish";

            "workbench.iconTheme" = "material-icon-theme";

            "[markdown]" = {
              "editor.defaultFormatter" = "yzhang.markdown-all-in-one";
            };
          };
          defaultExtensions = pkgs.nix4vscode.forOpenVsx [
            "aaron-bond.better-comments"
            "christian-kohler.path-intellisense"
            "jnoortheen.nix-ide"
            "mkhl.direnv"
            "nefrob.vscode-just-syntax"
            "PKief.material-icon-theme"
            "saoudrizwan.claude-dev"
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
            extensions = defaultExtensions;
          };

          Flutter = {
            userSettings = defaultSettings // {
              "[dart]" = {
                "editor.formatOnSave" = true;
                "editor.formatOnType" = true;

                "editor.rulers" = [ 80 ];

                "editor.selectionHighlight" = false;

                "editor.tabCompletion" = "onlySnippets";

                "editor.wordBasedSuggestions" = "off";
              };
            };

            extensions =
              defaultExtensions
              ++ pkgs.nix4vscode.forOpenVsx [
                "Dart-Code.dart-code"
                "Dart-Code.flutter"
                "tombi-toml.tombi"
              ];
          };

          Python = {
            userSettings = defaultSettings;

            extensions =
              defaultExtensions
              ++ pkgs.nix4vscode.forOpenVsx [
                "charliermarsh.ruff"
                "ms-python.debugpy"
                "ms-python.python"
                "ms-toolsai.jupyter"
              ];
          };

          Rust = {
            userSettings = defaultSettings // {
              "[rust]" = {
                "editor.defaultFormatter" = "rust-lang.rust-analyzer";
              };
            };

            extensions =
              defaultExtensions
              ++ pkgs.nix4vscode.forOpenVsx [
                "rust-lang.rust-analyzer"
                "Slint.slint"
                "tombi-toml.tombi"
              ];
          };
        };
    };
  };
}
