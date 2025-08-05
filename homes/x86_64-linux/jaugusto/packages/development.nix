{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devenv
    lldb
    rustlings
    scrcpy
    typescript
    uv
  ];
}
