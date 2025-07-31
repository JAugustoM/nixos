{ pkgs, ... }:
with pkgs;
[
  # Bash
  bash-language-server
  shellcheck
  shfmt

  # C/C++
  clang-tools

  # CMake
  neocmakelsp

  # Fish
  fish-lsp

  # HTML/CSS/JSON
  superhtml
  vscode-langservers-extracted

  # Java
  jdt-language-server

  # Just
  just-lsp

  # Markdown
  ltex-ls-plus
  markdown-oxide

  # Nix
  nixd
  nixfmt

  # Python
  ruff

  # Systemd
  systemd-lsp

  # TOML
  taplo

  # Typescript
  biome
  typescript-language-server

  # YAML
  yaml-language-server
]
