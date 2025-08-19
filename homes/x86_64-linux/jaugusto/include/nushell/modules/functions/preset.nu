# Create a project with a preset
export def main [] {
  "Select a preset to use"
}

# Create a pico c sdk project
export def pico [
  name: string # Project name
] {
  mkdir $name
  cd $name
  cp -r ~/Templates/pico-sdk-template/* .
  devenv init
}

# Create a typescript project
export def ts [
  name: string # Project name
] {
  mkdir $name
  cd $name
  cp -r ~/Templates/typescript-template/* .
  devenv init 
}

# Create a simple CPP project
export def cpp [
  name: string # Project name
] {
  mkdir $name
  cd $name
  cp -r ~/Templates/cpp-template/* .
  open devenv.nix | str replace -a TODO $name | save -f devenv.nix
  open CMakeLists.txt | str replace -a TODO $name | save -f CMakeLists.txt
  devenv init 
}
