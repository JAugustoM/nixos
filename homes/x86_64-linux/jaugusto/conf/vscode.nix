{
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    keybindings = import ../include/vscode/keybindings.nix;
    profiles = import ../include/vscode/profiles.nix { inherit pkgs; };
  };

  catppuccin.vscode.profiles = {
    default = { };
    Bison = { };
    Rust = { };
    Web = { };
  };
}
