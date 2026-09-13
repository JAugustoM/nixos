{
  den.aspects.editors.nvf.utility = {
    nixos = {
      programs.nvf.settings.vim = {
        comments.comment-nvim.enable = true;

        mini = {
          ai.enable = true;
          pairs.enable = true;
        };

        utility = {
          direnv.enable = true;
          motion.flash-nvim.enable = true;
          surround.enable = true;

          snacks-nvim = {
            enable = true;
            setupOpts = {
              animate.enabled = true;
              bigfile.enabled = true;
              dashboard.enabled = true;
              explorer.enabled = true;
              indent.enabled = true;
              input.enabled = true;
              picker.enabled = true;
              quickfile.enabled = true;
              scroll.enabled = true;
              words.enabled = true;

              notifier = {
                enabled = true;
                timeout = 3000;
              };
            };
          };
        };
      };
    };
  };
}
