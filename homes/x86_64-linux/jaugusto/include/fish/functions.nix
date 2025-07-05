{
  build-nix = {
    description = "Builds nix home-manager without updating flakes inputs";
    body = builtins.readFile ./functions/build-nix.fish;
  };
  edit-home = {
    description = "Open home-manager folder in neovim";
    body = builtins.readFile ./functions/edit-home.fish;
  };
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
  update-pkgs = {
    description = "Upgrades packages from dnf and flatpak";
    body = builtins.readFile ./functions/update-pkgs.fish;
  };
  update-nix = {
    description = "Upgrades packages from nix";
    body = builtins.readFile ./functions/update-nix.fish;
  };
}
