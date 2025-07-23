{
  borders.enable = true;
  noice.enable = true;
  colorizer.enable = true;
  modes-nvim.enable = false;
  illuminate.enable = true;
  breadcrumbs = {
    enable = true;
    navbuddy.enable = true;
  };
  smartcolumn = {
    enable = true;
    setupOpts.custom_colorcolumn = {
      nix = "110";
      ruby = "120";
      java = "130";
      go = ["90" "130"];
    };
  };
  fastaction.enable = true;
}
