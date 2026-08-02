{
  den.aspects.specialisations.faculdade = {
    nixos = { lib, ... }: {
      specialisation.Faculdade.configuration = {
        services = {
          dnscrypt-proxy.enable = lib.mkForce false;
          resolved.enable = lib.mkForce true;
        };
        networking = {
          networkmanager = {
            dns = lib.mkForce "default";
            wifi.backend = lib.mkForce "wpa_supplicant";
          };
          nameservers = lib.mkForce [ ];
          useDHCP = lib.mkForce true;
          wireless = {
            enable = lib.mkForce true;
            iwd.enable = lib.mkForce false;
          };
        };
      };
    };
  };
}
