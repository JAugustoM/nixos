# Create a project with a preset
export def main [] {
  "Select a preset to use"
}

# Create a pico c sdk project
export def pico [
  name: string # Folder name of the project
] {
  mkdir $name
  cd $name
  cp -r ~/Templates/pico-sdk-template/* .
  devenv init
}

# Create a typescript project
export def ts [
  name: string # Folder name of the project
] {
  mkdir $name
  cd $name
  cp -r ~/Templates/typescript-template/* .
  devenv init 
}
