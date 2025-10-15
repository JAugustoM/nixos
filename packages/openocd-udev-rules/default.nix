{
  writeTextFile,
  ...
}:

writeTextFile {
  name = "openocd-udev-rules";
  text = builtins.readFile ./60-openocd.rules;
  destination = "/etc/udev/rules.d/60-openocd.rules";
}
