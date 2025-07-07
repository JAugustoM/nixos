{
  preset-picosdk = {
    description = "Creates a folder with the Pico SDK template";
    body = builtins.readFile ./functions/preset-picosdk.fish;
  };
  preset-typescript = {
    description = "Creates a folder with the Typescript template";
    body = builtins.readFile ./functions/preset-typescript.fish;
  };
  setup-gh = {
    description = "Setup for gh";
    body = builtins.readFile ./functions/setup-gh.fish;
  };
  setup-picotool = {
    description = "Setup for picotool";
    body = builtins.readFile ./functions/setup-picotool.fish;
  };
  update-flake = {
    description = "Updates system flake inputs";
    body = builtins.readFile ./functions/update-flake.fish;
  };
}
