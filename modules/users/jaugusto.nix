{ den, __findFile, ... }:
let
  name = "José Moraes";
  email = "joseaugustomoraes@protonmail.com";
in
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
      <services/navidrome>
      # <services/glance>
      <services/peertube>
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

    nixos = { pkgs, ... }: {
      users.users.jaugusto = {
        description = name;
        extraGroups = [
          "dialout"
          "input"
        ];
      };

      programs = {
        partition-manager.enable = true;

        appimage = {
          enable = true;
          binfmt = true;
        };
        gpu-screen-recorder = {
          enable = true;
          ui.enable = true;
        };
      };

      services.flatpak.packages = [
        "com.stremio.Stremio"
        "com.valvesoftware.Steam.CompatibilityTool.Proton-GE"
        "io.appflowy.AppFlowy"
        "io.github.giantpinkrobots.flatsweep"
        "org.freedesktop.Platform.codecs-extra"
        "org.gnome.Boxes"
        "org.gnome.Boxes.Extension.OsinfoDb"
      ];

      services.mysql = {
        enable = true;
        package = pkgs.mysql84;
      };
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
            bottles
            brmodelo
            camunda-modeler
            gelly
            heroic
            haruna
            kdePackages.kdenlive
            kdePackages.okular
            lazyjournal
            lrcget
            picard
            ventoy
          ];

          sessionPath = [
            "$HOME/.local/bin"
          ];
        };

        programs = {
          dbeaver.enable = true;
          discord.enable = true;
          obsidian.enable = true;
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
                email = email;
                name = name;
                signingkey = "~/.ssh/id_ed25519.pub";
              };
            };
          };
        };
      };
  };
}
