{
  preset = {
    description = "Copies project preset";
    body = builtins.readFile ./functions/preset.fish;
  };
}
