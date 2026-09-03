{ den, __findFile, ... }:
{
  den.aspects.shell.default = {
    includes = [
      <shell/beets>
      <shell/devtools>
      <shell/fish>
      # <shell/herdr>
      <shell/kitty>
      <shell/nh>
      <shell/yazi>
      <shell/yt-dlp>
    ];

    homeManager = { pkgs, ... }: {
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

        eza = {
          enable = true;
          git = true;
          icons = "always";
        };

        starship = {
          enable = true;
          enableInteractive = true;
          enableTransience = true;
          settings = fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/jetpack.toml");
        };
      };
    };
  };
}
