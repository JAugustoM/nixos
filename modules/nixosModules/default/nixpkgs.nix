{ inputs, moduleWithSystem, ... }:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    {
      imports = [ inputs.chaotic.nixosModules.default ];

      sops.secrets."github_key" = { };

      nix = {
        extraOptions = ''
          !include ${config.sops.secrets."github_key".path}
        '';
        nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
        settings = {
          auto-optimise-store = true;
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          trusted-users = [
            "root"
            "@wheel"
          ];
        };
      };

      nixpkgs = {
        config.allowUnfree = true;
        overlays = [
          inputs.self.overlays.ffmpeg-full
        ];
      };
    }
  );
}
