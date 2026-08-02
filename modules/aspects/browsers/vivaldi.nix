{
  den.aspects.browsers.vivaldi = {
    homeManager =
      { pkgs, ... }:
      {
        programs.chromium = {
          enable = true;
          package = (
            pkgs.vivaldi.override {
              proprietaryCodecs = true;
              enableWidevine = true;
            }
          );
          extensions = [
            "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
            "oboonakemofpalcgghocfoadofidjkkk" # KeePassXC
            "ofeajdebdjajhkmcmamagokecnbephhl" # Motrix Next
          ];
        };
      };
  };
}
