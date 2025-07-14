{ ... }:
{
  programs.bash = {
    enable = true;
    initExtra = builtins.readFile ../include/bash/initExtra.bash;
  };
}
