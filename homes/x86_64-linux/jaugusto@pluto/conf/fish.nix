{ ... }:
{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      nob = "nh os boot";
      nos = "nh os switch";
      nca = "nh clean all --keep 5";
    };

    shellAliases = {
      build-iso = ''nom build "$NH_FLAKE"#install-isoConfigurations.terra'';
      check-flake = ''nix repl --expr "builtins.getFlake (builtins.toString $NH_FLAKE)"'';
      flakeup = "nix flake update --flake $NH_FLAKE";
    };

    functions = import ../include/fish/functions.nix;
    interactiveShellInit = builtins.readFile ../include/fish/shell_init.fish;
  };
}
