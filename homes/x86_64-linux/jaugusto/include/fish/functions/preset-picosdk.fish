if test "$(count $argv)" -ge 1
    mkdir $argv[1]
    cd $argv[1]
    cp -r ~/Templates/pico-sdk-template/. .
    devenv init
else
    echo "Please specify folder name"
end
