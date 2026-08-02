{
  den.aspects.editors.nvf.utility = {
    nixos = { pkgs, ... }: {
      programs.nvf.settings.vim = {
        comments.comment-nvim.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
        };

        mini = {
          ai.enable = true;
          pairs.enable = true;
        };

        telescope = {
          enable = true;

          extensions = [
            {
              name = "fzf";
              packages = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
              setup = {
                fzf = {
                  fuzzy = true;
                  override_generic_sorter = true;
                  override_file_sorter = true;
                };
              };
            }
          ];
        };

        utility = {
          direnv.enable = true;
          motion.flash-nvim.enable = true;
          surround.enable = true;
        };
      };
    };
  };
}
