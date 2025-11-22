{ ... }:
{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      nos = "nh os switch";
      nhs = "nh home switch";
      nca = "nh clean all --keep 5";
    };

    shellAliases = {
      build-iso = ''nom build "$NH_FLAKE"#install-isoConfigurations.terra'';
      check-flake = ''nix repl --expr "builtins.getFlake (builtins.toString $NH_FLAKE)"'';
      flakeup = "nix flake update --flake $NH_FLAKE";
    };
  };
}
