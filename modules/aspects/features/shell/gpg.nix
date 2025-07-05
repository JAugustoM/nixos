{
  den.aspects.shell.gpg = {
    homeManager =
      { pkgs, ... }:
      {
        programs.gpg.enable = true;

        services.gpg-agent = {
          enable = true;
          enableSshSupport = true;
          pinentry.package = pkgs.pinentry-qt;
          sshKeys = [ "396763E5BEA44BD9B7EF131BEFEAEC50A3BADEBA" ];
        };
      };
  };
}
