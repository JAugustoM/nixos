{
  lib,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, ... }:
    {
      imports = [
        inputs.determinate.nixosModules.default
      ];

      config = lib.mkMerge [
        {
          nix = {
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
              substituters = [
                "https://attic.xuyh0120.win/lantian"
              ];
              trusted-public-keys = [
                "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
              ];
            };
          };

          nixpkgs = {
            config.allowUnfree = true;
            overlays = with inputs; [
              self.overlays.ffmpeg-full
              nix4vscode.overlays.default
              nix-cachyos-kernel.overlays.pinned
              nur.overlays.default
            ];
          };
        }
        (lib.mkIf (config.modules.sops.enable) {
          sops.secrets."nix_conf" = { };

          nix.extraOptions = ''
            !include ${config.sops.secrets."nix_conf".path}
          '';
        })
      ];
    }
  );
}
