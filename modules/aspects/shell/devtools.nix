{
  den.aspects.shell.devtools = {
    nixos = { pkgs, ... }: {
      programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
          freetype
          keybinder3
          libgbm
          libinput
        ];
      };
    };

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        gcc
        glow
        rustup
      ];

      home.sessionPath = [
        "~/.cargo/bin"
      ];

      programs = {
        bun.enable = true;
        devenv.enable = true;
        tealdeer.enable = true;
        uv.enable = true;

        delta = {
          enable = true;
          enableGitIntegration = true;
        };
      };
    };
  };
}
