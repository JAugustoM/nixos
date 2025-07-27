{ 
  pkgs,
  ... 
}:
{
  programs.vscode = {
    enable = true;
    profiles = import ../include/vscode/profiles.nix { inherit pkgs; };
  };
}
