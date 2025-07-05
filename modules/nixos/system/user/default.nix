{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "user";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      user = lib.mkOption {
        description = "User to make";
        type = types.str;
        default = "";
      };
      userName = lib.mkOption {
        description = "User name";
        type = types.str;
        default = "";
      };
      extraGroups = lib.mkOption {
        description = "Groups to add user";
        type = types.listOf types.str;
        default = [];
      };
      specialGroups = lib.mkOption {
        description = "Groups to create and add user";
        type = types.listOf types.str;
        default = [];
      };
    };
  };
  config = {
    users.users.${cfg.user} = {
      isNormalUser = true;
      description = cfg.userName;
      extraGroups = cfg.extraGroups;
    };

    # (builtins.listToAttrs builtins.map (x: { name = "${x}.members"; value = cfg.user; }) cfg.specialGroups);
    users.groups.plugdev.members = [ cfg.userName ];

  };
}
