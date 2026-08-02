{
  den.aspects.editors.nvf.keymaps = {
    nixos.programs.nvf.settings.vim = {
      keymaps = [
        {
          key = "<A-q>";
          mode = "n";
          action = ":wqall<CR>";
          desc = "Save and Quit All";
        }
        {
          key = "<leader>bo";
          mode = "n";
          action = ":BufferLineCloseOthers<CR>";
          desc = "Close Other Buffers";
        }
        {
          key = "<leader>e";
          mode = "n";
          action = ":Neotree toggle<CR>";
          desc = "Explorer NeoTree (Root Dir)";
        }
        {
          key = "<leader>E";
          mode = "n";
          action = ":Neotree reveal<CR>";
          desc = "Explorer NeoTree (cwd)";
        }
        {
          key = "<S-h>";
          mode = "n";
          action = ":BufferLineCyclePrev<cr>";
          desc = "Prev Buffer";
        }
        {
          key = "<S-l>";
          mode = "n";
          action = ":BufferLineCycleNext<cr>";
          desc = "Next Buffer";
        }
        {
          key = "<C-h>";
          mode = "n";
          action = "<C-w>h";
          silent = true;
          desc = "Go to Left Window";
        }
        {
          key = "<C-j>";
          mode = "n";
          action = "<C-w>j";
          silent = true;
          desc = "Go to Lower Window";
        }
        {
          key = "<C-k>";
          mode = "n";
          action = "<C-w>k";
          silent = true;
          desc = "Go to Upper Window";
        }
        {
          key = "<C-l>";
          mode = "n";
          action = "<C-w>l";
          silent = true;
          desc = "Go to Right Window";
        }
        {
          key = "<leader><space>";
          mode = "n";
          action = ":Telescope find_files<CR>";
          desc = "Find Files (Root Dir)";
        }
        {
          key = "<leader>fn";
          mode = "n";
          action = ":Navbuddy<CR>";
          desc = "Open Navbuddy";
        }
      ];
    };
  };
}
