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
          flakeup = "nix flake update --flake $NH_FLAKE";
          reset-ssh = "systemctl --user restart gpg-agent.socket gpg-agent-ssh.socket && gpg-connect-agent updatestartuptty /bye";
        };
      };
    };
  };
}
