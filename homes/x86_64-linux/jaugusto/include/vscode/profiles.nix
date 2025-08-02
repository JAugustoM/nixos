{
  pkgs,
  ...
}:
let
  defaultSettings = {
    "editor.fontFamily" = "'Adwaita Mono', 'Droid Sans Mono', 'monospace', monospace";
    "editor.fontLigatures" = true;
    "editor.formatOnSave" = true;
    "terminal.integrated.defaultProfile.linux" = "fish";
    "telemetry.telemetryLevel" = "off";
    "direnv.restart.automatic" = true;
    "ltex.language" = "pt-BR";
    "ltex.languageToolHttpServerUri" = "http://localhost:8081/";
  };
  defaultExtensios = pkgs.nix4vscode.forVscode [
    "mkhl.direnv"
  ];
in
{
  default = {
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    userSettings = defaultSettings;
    extensions = defaultExtensios;
  };

  "Pico C SDK" = {
    userSettings = defaultSettings;

    extensions =
      defaultExtensios
      ++ pkgs.nix4vscode.forVscode [
        "marus25.cortex-debug"
        "mcu-debug.debug-tracker-vscode"
        "mcu-debug.memory-view"
        "mcu-debug.peripheral-viewer"
        "mcu-debug.rtos-views"
        "ms-python.debugpy"
        "ms-python.python"
        "ms-python.vscode-pylance"
        "ms-vscode.cmake-tools"
        "ms-vscode.cpptools"
        "ms-vscode.cpptools-extension-pack"
        "ms-vscode.cpptools-themes"
        "ms-vscode.vscode-serial-monitor"
        "paulober.pico-w-go"
        "raspberry-pi.raspberry-pi-pico"
      ];
  };

  Rust = {
    userSettings = defaultSettings;

    extensions =
      defaultExtensios
      ++ pkgs.nix4vscode.forVscode [
        "fill-labs.dependi"
        "rust-lang.rust-analyzer"
        "tamasfe.even-better-toml"
        "vadimcn.vscode-lldb"
      ];
  };
}
