{
  edit-flake = {
    description = "Opens neovim in system flake";
    body = builtins.readFile ./functions/edit-flake.fish;
  };
  preset-picosdk = {
    description = "Creates a folder with the Pico SDK template";
    body = builtins.readFile ./functions/preset-picosdk.fish;
  };
  preset-typescript = {
    description = "Creates a folder with the Typescript template";
    body = builtins.readFile ./functions/preset-typescript.fish;
  };
  update-flake = {
    description = "Updates system flake inputs";
    body = builtins.readFile ./functions/update-flake.fish;
  };
}
