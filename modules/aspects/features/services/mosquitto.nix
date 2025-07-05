{
  den.aspects.services.mosquitto = {
    nixos = {
      services.mosquitto = {
        enable = true;
        persistence = true;

        listeners = [
          {
            port = 1883;

            users.esp32 = {
              acl = [ "readwrite #" ];
              hashedPasswordFile = "/etc/mosquitto/password";
            };

            settings = {
              allow_anonymous = false;
            };
          }
        ];
      };

      networking.firewall.allowedTCPPorts = [ 1883 ];
    };
  };
}
