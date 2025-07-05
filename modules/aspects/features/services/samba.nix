{ ... }:
{
  den.aspects.services.samba = { user, ... }: {
    nixos = {
      services.samba = {
        enable = true;
        openFirewall = true;
        settings = {
          global = {
            "workgroup" = "WORKGROUP";
            "server string" = "nixos-host";
            "netbios name" = "nixos-host";
            "security" = "user";
            "map to guest" = "bad user";
          };

          "vm-share" = {
            "path" = "/home/${user.name}/vm-share";
            "browseable" = "yes";
            "read only" = "no";
            "guest ok" = "no";
            "create mask" = "0644";
            "directory mask" = "0755";
            "force user" = "${user.name}";
          };
        };
      };

      services.samba-wsdd = {
        enable = true;
        openFirewall = true;
      };

      users.users.${user.name}.extraGroups = [ "samba" ];
    };
  };
}
