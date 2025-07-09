mkdir "$argv[2]"
cd "$argv[2]"

switch $argv[1]
    case pico-sdk
        cp -r ~/Templates/pico-sdk-template/* .
        devenv init
    case ts
        cp -r ~/Templates/script-template/* .
        devenv init
    case cpp
        cp -r ~/Templates/cpp-template/* .
        sed -i "s/TODO/$argv[2]/g" devenv.nix
        sed -i "s/TODO/$argv[2]/g" CMakeLists.txt
        devenv init
end
