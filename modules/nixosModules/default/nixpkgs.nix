{ inputs, moduleWithSystem, ... }:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    {
      imports = [
        inputs.determinate.nixosModules.default
      ];

      sops.secrets."nix_conf" = { };

      nix = {
        extraOptions = ''
          !include ${config.sops.secrets."nix_conf".path}
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
          inputs.nix4vscode.overlays.default
          inputs.nur.overlays.default
        ];
      };
    }
  );
}
