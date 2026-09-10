{
  den.aspects.shell.fish = {
    homeManager = {
      programs.fish = {
        enable = true;

        shellAbbrs = {
          nos = "nh os switch";
          nob = "nh os boot";
          nhs = "nh home switch --ask --backup-extension bak";
          nca = "nh clean all --keep 5";
        };

        shellAliases = {
          check-flake = ''nix repl --expr "builtins.getFlake (builtins.toString $NH_FLAKE)"'';
          tackup = "nix run $NH_FLAKE#write-tack";
        };
      };
    };
  };
}
