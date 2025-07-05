{
  den.aspects.editors.nvf.binds = {
    nixos.programs.nvf.settings.vim = {
      binds = {
        cheatsheet.enable = true;
        whichKey = {
          enable = true;
          setupOpts.preset = "helix";
          register = {
            "<leader>d" = "DAP";
            "<leader>dg" = "Step";
            "<leader>dv" = "Go up/down stacktrace";

            "<leader>l" = "LSP";
            "<leader>lg" = "Go to";
            "<leader>lt" = "Toogle format";

            "<leader>lw" = "Workspace";

            "<leader>c" = "Git Conflict";
            "<leader>t" = "Git Blame";
          };
        };
      };
    };
  };
}
