{ lib, ... }:
{
  concatUdevRules =
    x:
    with builtins;
    if isList x && all isPath x then (concatStringsSep "\n" (map builtins.readFile x)) else "";
}
