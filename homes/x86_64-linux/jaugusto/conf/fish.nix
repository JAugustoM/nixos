{ ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      flakeup = "nix flake update --flake $NH_FLAKE";
      build-iso = ''nix build "$NH_FLAKE"#nixosConfigurations.iso.config.system.build.isoImage'';
    };

    functions = import ../include/fish/functions.nix;
    interactiveShellInit = builtins.readFile ../include/fish/shell_init.fish;
  };
}
