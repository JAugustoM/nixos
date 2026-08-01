let
  jaugusto = {
    include = "/home/jaugusto/.config/nixos/include";
    theme = "dracula";
    wallpaper = "City";
  };
in
{
  den.hosts.x86_64-linux = {
    erebus = {
      users = {
        inherit jaugusto;
      };
      secureBoot = true;
      tailnet = "snapper-boa.ts.net";
    };
    gaia = { };
  };
}
