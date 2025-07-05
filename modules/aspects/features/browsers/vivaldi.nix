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
            "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
            "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
            "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
          ];
        };
      };
  };
}
