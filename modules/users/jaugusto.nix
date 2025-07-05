{ den, __findFile, ... }:
{
  den.aspects.jaugusto = { user, ... }: {
    includes = [
      <den/primary-user>
      (den.batteries.user-shell "fish")
      <browsers/zen>
      <desktop/cosmic>
      <gaming/retroarch>
      <gaming/steam>
      <greeters/cosmic-greeter>
      <runners/vicinae>
      <runners/walker>
      <services/freshrss>
      <services/syncthing>
      <services/tailscale>
      <services/udiskie>
      <specialisations/faculdade>
      <shell/default>
      <virtualisation/podman>
      <editors>
      <flatpak>
      <keepassxc>
      <stylix>
    ];

    nixos = {
      users.users.jaugusto = {
        description = "José Augusto";
        extraGroups = [
          "dialout"
          "input"
        ];
      };

      programs.partition-manager.enable = true;

      services.flatpak.packages = [
        "com.stremio.Stremio"
        "com.usebottles.bottles"
        "io.github.giantpinkrobots.flatsweep"
        "org.freedesktop.Platform.codecs-extra"
      ];
    };

    homeManager =
      { config, pkgs, ... }:
      let
        link = config.lib.file.mkOutOfStoreSymlink;
      in
      {
        home = {
          file."Pictures/Wallpapers".source = link "${user.include}/wallpapers";

          packages = with pkgs; [
            affine
            euphonica
            foliate
            harmonoid
            haruna
            kdePackages.kdenlive
            kdePackages.okular
            lrcget
            obsidian
            picard
            unrar
          ];

          sessionPath = [
            "$HOME/.local/bin"
          ];
        };

        services.mpd.enable = true;

        programs = {
          discord.enable = true;
          zapzap.enable = true;

          git = {
            enable = true;
            lfs.enable = true;

            ignores = [
              ".devenv"
              ".direnv"
              ".envrc"
            ];

            settings = {
              commit.gpgsign = true;
              gpg.format = "ssh";
              tag.gpgsign = true;

              user = {
                email = "joseaugustomoraes@protonmail.com";
                name = "José Moraes";
                signingkey = "~/.ssh/id_ed25519.pub";
              };
            };
          };
        };
      };
  };
}
