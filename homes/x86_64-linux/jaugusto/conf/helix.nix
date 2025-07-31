{ 
  pkgs,
  ... 
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = import ../include/helix/extraPackages.nix { inherit pkgs; };
    languages = import ../include/helix/languages.nix;
    settings = import ../include/helix/settings.nix;
  };
}
