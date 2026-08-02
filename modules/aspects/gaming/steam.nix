{ inputs, ... }:
{
  flake-file.inputs = {
    nix-gaming.url = "github:fufexan/nix-gaming";
  };
  den.aspects.gaming.steam = {
    nixos =
      { pkgs, ... }:
      let
        gamewrap = pkgs.writeShellApplication {
          name = "gamewrap";
          runtimeInputs = with pkgs; [
            gamemode
            gamescope
          ];
          text = ''
            export __NV_PRIME_RENDER_OFFLOAD=1
            export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
            export __GLX_VENDOR_LIBRARY_NAME=nvidia
            export __VK_LAYER_NV_optimus=NVIDIA_only

            exec gamemoderun gamescope -h 720 -H 1440 -f -- "$@"
          '';
        };
      in
      {
        imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];

        environment.systemPackages = with pkgs; [
          gamescope-wsi
          gamewrap
        ];

        programs = {
          gamemode.enable = true;
          gamescope = {
            enable = true;
            capSysNice = false;
          };
          steam = {
            enable = true;
            gamescopeSession.enable = true;
            platformOptimizations.enable = true;

            extraCompatPackages = with pkgs; [
              proton-ge-bin
            ];
          };
        };
      };
  };
}
