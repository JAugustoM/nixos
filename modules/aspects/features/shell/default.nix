{ den, ... }:
{
  den.aspects.shell.default = {
    includes = [
      den.aspects.shell.devtools
      den.aspects.shell.eza
      den.aspects.shell.fish
      den.aspects.shell.kitty
      den.aspects.shell.nh
      den.aspects.shell.starship
      den.aspects.shell.yazi
      den.aspects.shell.yt-dlp
    ];

    homeManager = {
      programs = {
        bat.enable = true;
        btop.enable = true;
        carapace.enable = true;
        distrobox.enable = true;
        fastfetch.enable = true;
        fzf.enable = true;
        lazygit.enable = true;
        mangohud.enable = true;
        nix-index.enable = true;
        ripgrep.enable = true;
        zoxide.enable = true;
      };
    };
  };
}
