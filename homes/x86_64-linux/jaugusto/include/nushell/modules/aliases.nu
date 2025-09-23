export alias flakeup = nix flake update --flake $env.NH_FLAKE
export alias build-iso = nix build $"($env.NH_FLAKE)#nixosConfigurations.iso.config.system.build.isoImage"
