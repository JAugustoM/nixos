{
  den.aspects.pass.keepassxc = { user, ... }: {
    homeManager = { link, ... }: {
      xdg = {
        autostart.enable = true;
        configFile."keepassxc/keepassxc.ini".source = link "${user.include}/keepassxc/keepassxc.ini";
      };

      programs.keepassxc = {
        enable = true;
        autostart = true;
      };
    };
  };
}
