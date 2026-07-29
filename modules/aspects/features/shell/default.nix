{ den, __findFile, ... }:
{
  den.aspects.shell.default = {
    includes = [
      <shell/devtools>
      <shell/eza>
      <shell/fish>
      <shell/herdr>
      <shell/kitty>
      <shell/nh>
      <shell/starship>
      <shell/yazi>
      <shell/yt-dlp>
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
