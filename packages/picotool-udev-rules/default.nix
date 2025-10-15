{
  writeTextFile,
  ...
}:

writeTextFile {
  name = "picotool-udev-rules";
  text = builtins.readFile ./99-picotool.rules;
  destination = "/etc/udev/rules.d/99-picotool.rules";
}
