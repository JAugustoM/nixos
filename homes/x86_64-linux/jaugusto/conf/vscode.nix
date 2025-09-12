{
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles = import ../include/vscode/profiles.nix { inherit pkgs; };
  };

  catppuccin.vscode.profiles = {
    default = { };
    Bison = { };
    Rust = { };
    Web = { };
  };
}
