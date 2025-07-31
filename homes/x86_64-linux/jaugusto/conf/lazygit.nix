{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      os.edit = "hx {{filename}}";
    };
  };
}
