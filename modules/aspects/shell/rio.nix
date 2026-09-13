{
  den.aspects.shell.rio = {
    homeManager = {
      programs.rio = {
        enable = true;
        settings = fromTOML ''
          confirm-before-quit = false
          copy-on-select = true

          [cursor]
          blinking = true

          [editor]
          program = "hx"

          [shell]
          program = "fish"
        '';
      };
    };
  };
}
