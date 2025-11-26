{ ... }:
{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      nos = "nh os switch";
      nhs = "nh home switch --backup-extension bak";
      nca = "nh clean all --keep 5";
    };

    shellAliases = {
      build-iso = ''nom build "$NH_FLAKE"#nixosConfigurations.terra.config.formats.install-iso'';
      check-flake = ''nix repl --expr "builtins.getFlake (builtins.toString $NH_FLAKE)"'';
      flakeup = "nix flake update --flake $NH_FLAKE";
    };
  };
}
