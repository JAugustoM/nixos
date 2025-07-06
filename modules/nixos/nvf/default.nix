{
  config,
  lib,
  ...
}:
let
  types = lib.types;
  moduleName = "nvf";
  cfg = config.modules.${moduleName};
in
{
  options = {
    modules.${moduleName} = {
      enable = lib.mkEnableOption "Enable nvf";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nvf = {
      enable = true;
      settings.vim = {
        spellcheck = import ./include/spellcheck.nix;
        lsp = import ./include/lsp.nix;
        debugger = import ./include/debugger.nix;
        languages = import ./include/languages.nix;
        statusline = import ./include/statusline.nix;
        theme = import ./include/theme.nix;
        autopairs = import ./include/autopairs.nix;
        autocomplete = import ./include/autocomplete.nix;
        snippets = import ./include/snippets.nix;
        filetree = import ./include/filetree.nix;
        tabline = import ./include/tabline.nix;
        treesitter = import ./include/treesitter.nix;
        binds = import ./include/binds.nix;
        telescope = import ./include/telescope.nix;
        git = import ./include/git.nix;
        minimap = import ./include/minimap.nix;
        dashboard = import ./include/dashboard.nix;
        notify = import ./include/notify.nix;
        projects = import ./include/projects.nix;
        utility = import ./include/utility.nix;
        notes = import ./include/notes.nix;
        terminal = import ./include/terminal.nix;
        ui = import ./include/ui.nix;
        session = import ./include/session.nix;
        comments = import ./include/comments.nix;
      };
    };
  };
}
