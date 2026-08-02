{
  den.aspects.services.udiskie = {
    nixos = {
      services.udisks2.enable = true;
    };

    homeManager = {
      services.udiskie = {
        enable = true;
        settings.device_config = [
          {
            id_uuid = "2025-04-09-12-30-25-00";
            options = [
              "noexec"
              "nodev"
            ];
            automount = true;
          }
          {
            id_uuid = "1980-01-01-00-00-00-00";
            options = [
              "noexec"
              "nodev"
            ];
            automount = true;
          }
          {
            id_uuid = "ce456e51-e2cb-c6b8-c29d-4bb6f6d02e37";
            options = [
              "noexec"
              "nodev"
            ];
            automount = true;
          }
        ];
      };
    };
  };
}
