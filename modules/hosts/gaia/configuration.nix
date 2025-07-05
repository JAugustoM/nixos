{
  den.aspects.gaia = {
    nixos = { pkgs, modulesPath, ... }: {
      image.modules.iso-installer = import "${modulesPath}/installer/cd-dvd/installation-cd-graphical-gnome.nix";

      services = {
        pcscd.enable = true;

        openssh = {
          enable = true;
          openFirewall = true;
          settings = {
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
          };
        };
      };

      users.users.nixos.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAFj8WOKeYDt4tdjhZo/1t5pK5rGUfvG4KIJlKDFs0nS jaugusto@erebus"
      ];

      environment.systemPackages = with pkgs; [
        disko
        git
        nixos-facter
        sops
        yubikey-manager
      ];
    };
  };
}
