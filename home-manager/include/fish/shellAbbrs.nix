{
  picoserial = "sudo minicom --device /dev/ttyACM0";
  cn = "cmake -G Ninja -B build -S .";
  nb = "ninja -C build";
  sdi = {
    setCursor = true;
    expansion = "sudo dnf install %";
  };
  sdr = {
    setCursor = true;
    expansion = "sudo dnf remove %";
  };
  ez = {
    setCursor = true;
    expansion = "eza -a -l -T -L 1% --git";
  };
}
