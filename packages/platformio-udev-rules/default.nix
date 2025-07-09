{
  writeTextFile,
  ...
}:

writeTextFile {
  name = "platformio-udev-rules";
  text = builtins.readFile ./99-platformio-udev.rules;
  destination = "/etc/udev/rules.d/99-platformio-udev.rules";
}
