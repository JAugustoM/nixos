mkdir "$argv[2]"
cd "$argv[2]"

if test $argv[1] = pico-sdk
    cp -r ~/Templates/pico-sdk-template/* .
    devenv init

else if test $argv[1] = ts
    cp -r ~/Templates/script-template/* .
    devenv init

else if test $argv[1] = cpp
    cp -r ~/Templates/cpp-template/* .
    sed -i "s/TODO/$argv[2]/g" devenv.nix
    sed -i "s/TODO/$argv[2]/g" CMakeLists.txt
    devenv init
end
