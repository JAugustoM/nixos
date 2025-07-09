{
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    profiles = import ../include/vscode/profiles.nix { inherit pkgs; };
  };

  catppuccin.vscode.profiles = {
    default = { };
    Bison = { };
    Embedded = { };
    Rust = { };
    Web = { };
  };
}
