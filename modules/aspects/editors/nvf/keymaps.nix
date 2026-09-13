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
          key = "<leader>fn";
          mode = "n";
          action = ":Navbuddy<CR>";
          desc = "Open Navbuddy";
        }

        # Snacks
        {
          mode = "n";
          key = "<leader>e";
          action = "<cmd>lua Snacks.explorer()<cr>";
          desc = "Snacks File Explorer";
        }

        {
          mode = "n";
          key = "<leader><space>";
          action = "<cmd>lua Snacks.picker.smart()<cr>";
          desc = "Find Files (Smart)";
        }
        {
          mode = "n";
          key = "<leader>/";
          action = "<cmd>lua Snacks.picker.grep()<cr>";
          desc = "Grep Workspace";
        }

        {
          mode = "n";
          key = "<leader>un";
          action = "<cmd>lua Snacks.notifier.hide()<cr>";
          desc = "Dismiss All Notifications";
        }
        {
          mode = "n";
          key = "<leader>nh";
          action = "<cmd>lua Snacks.notifier.show_history()<cr>";
          desc = "Notification History";
        }
        {
          mode = "n";
          key = "<c-/>";
          action = "<cmd>lua Snacks.terminal()<cr>";
          desc = "Toggle Floating Terminal";
        }
        {
          mode = "n";
          key = "<leader>ca";
          action = "<cmd>lua Snacks.picker.lsp_actions()<cr>";
          desc = "Code Action";
        }
        {
          mode = "n";
          key = "gd";
          action = "<cmd>lua Snacks.picker.lsp_definitions()<cr>";
          desc = "Goto Definition (Snacks)";
        }
        {
          mode = "n";
          key = "gr";
          action = "<cmd>lua Snacks.picker.lsp_references()<cr>";
          desc = "References (Snacks)";
        }
        {
          mode = "n";
          key = "gI";
          action = "<cmd>lua Snacks.picker.lsp_implementations()<cr>";
          desc = "Goto Implementation (Snacks)";
        }
        {
          mode = "n";
          key = "gy";
          action = "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>";
          desc = "Goto Type Definition (Snacks)";
        }
      ];
    };
  };
}
