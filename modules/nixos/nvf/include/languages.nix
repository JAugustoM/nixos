{
  # General Options
  enableFormat = true;
  enableTreesitter = true;
  enableExtraDiagnostics = true;

  # Enabled Languages
  nix.enable = true;
  markdown.enable = true;
  bash.enable = true;
  clang.enable = true;
  css.enable = true;
  html.enable = true;
  java.enable = true;
  ts.enable = true;
  lua.enable = true;
  python.enable = true;

  rust = {
    enable = true;
    crates.enable = true;
  };
}
