{
  pkgs,
  ...
}:
{
  default = {
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    userSettings = {
      "terminal.integrated.defaultProfile.linux" = "fish";
    };

    extensions = pkgs.nix4vscode.forVscode [
      "fill-labs.dependi"
      "marus25.cortex-debug"
      "mcu-debug.debug-tracker-vscode"
      "mcu-debug.memory-view"
      "mcu-debug.peripheral-viewer"
      "mcu-debug.rtos-views"
      "mkhl.direnv"
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
      "rust-lang.rust-analyzer"
      "tamasfe.even-better-toml"
      "vadimcn.vscode-lldb"
    ];
  };
}
