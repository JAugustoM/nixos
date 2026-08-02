{
  den.aspects.shell.devtools = {
    nixos = { pkgs, ... }: {
      programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
          freetype
          libgbm
          libinput
        ];
      };
    };

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        glow
      ];

      programs = {
        devenv.enable = true;
        tealdeer.enable = true;
        uv.enable = true;

        delta = {
          enable = true;
          enableGitIntegration = true;
        };

        direnv = {
          enable = true;
          silent = true;
          nix-direnv.enable = true;
        };
      };
    };
  };
}
