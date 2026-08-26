{ den, inputs, ... }:
{
  flake-file.inputs = {
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.editors.nvf = {
    includes = [
      den.aspects.editors.nvf.binds
      den.aspects.editors.nvf.keymaps
      den.aspects.editors.nvf.lsp
      den.aspects.editors.nvf.ui
      den.aspects.editors.nvf.utility
    ];

    nixos = {
      imports = [
        inputs.nvf.nixosModules.default
      ];

      programs.nvf = {
        enable = true;
        settings.vim = {
          enableLuaLoader = true;
          searchCase = "smart";
          syntaxHighlighting = true;

          options = {
            shiftwidth = 2;
            tabstop = 4;
          };
        };
      };
    };
  };
}
