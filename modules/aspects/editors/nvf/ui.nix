{
  den.aspects.editors.nvf.ui = {
    nixos.programs.nvf.settings.vim = {
      statusline.lualine = {
        enable = true;
        integrations.breadcrumbs = {
          navbuddy.enable = true;
          nvim-navic.enable = true;
        };
      };
      tabline.nvimBufferline.enable = true;

      ui = {
        colorful-menu-nvim.enable = true;
        colorizer.enable = true;
        fastaction.enable = true;
        smartcolumn.enable = true;

        noice = {
          enable = true;
          setupOpts = {
            lsp.signature.enable = true;
            notify.enabled = false;
          };
        };
      };

      visuals = {
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
      };
    };
  };
}
