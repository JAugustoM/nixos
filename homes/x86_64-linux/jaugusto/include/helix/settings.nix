{
  editor = {
    bufferline = "multiple";
    clipboard-provider = "wayland";
    cursorline = true;
    end-of-line-diagnostics = "hint";
    line-number = "relative";
    rulers = [ 120 ];
    shell = [
      "nu"
      "-c"
    ];
    true-color = true;

    cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };

    lsp = {
      display-inlay-hints = true;
      display-messages = true;
    };

    indent-guides = {
      render = true;
    };

    inline-diagnostics = {
      cursor-line = "warning";
    };
  };

  keys.normal = {
    A-x = "extend_to_line_bounds";
    X = "select_line_above";
  };

  keys.select = {
    A-x = "extend_to_line_bounds";
    X = "select_line_above";
  };
}
