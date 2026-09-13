{ den, __findFile, ... }:
let
  name = "José Moraes";
  email = "joseaugustomoraes@protonmail.com";
in
{
  den.aspects.jaugusto = { user, ... }: {
    includes = [
      <den/primary-user>
      <browsers/zen>
      <desktop/niri>
      <desktop/noctalia>
      <fileManagers/thunar>
      <gaming/retroarch>
      <gaming/steam>
      <greeters/noctalia-greeter>
      <services/navidrome>
      <services/glance>
      <services/syncthing>
      <services/tailscale>
      <services/udiskie>
      <specialisations/faculdade>
      <shell/default>
      <virtualisation/docker>
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

      networking.firewall.allowedTCPPorts = [ 8010 ];

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
        "com.usebottles.bottles"
        "com.valvesoftware.Steam.CompatibilityTool.Proton-GE"
        "io.appflowy.AppFlowy"
        "io.github.giantpinkrobots.flatsweep"
        "org.freedesktop.Platform.codecs-extra"
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
            brmodelo
            camunda-modeler
            drawio
            gearlever
            gelly
            gnome-text-editor
            heroic
            papers
            vlc
            winboat
          ];

          sessionPath = [
            "$HOME/.local/bin"
          ];
        };

        programs = {
          antigravity.enable = true;
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
