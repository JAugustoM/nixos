{
  lib,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.modules.nixos.default = moduleWithSystem (
    perSystem@{ ... }:
    nixos@{ config, pkgs, ... }:
    {
      config = lib.mkMerge [
        {
          nix = {
            package = pkgs.lix;
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
                "https://vicinae.cachix.org"
              ];
              trusted-public-keys = [
                "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
                "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
              ];
            };
          };

          nixpkgs = {
            config.allowUnfree = true;
            overlays = with inputs; [
              self.overlays.ffmpeg-full
              # nix4vscode.overlays.default
              nix-cachyos-kernel.overlays.pinned
              nur.overlays.default
            ];
          };
        }
      ];
    }
  );
}
