if test -n "$PICOTOOL_SETUP"
    echo "picotool setup completed previously!"
else
    sudo curl -o /etc/udev/rules.d/99-picotool.rules https://raw.githubusercontent.com/raspberrypi/picotool/refs/heads/master/udev/99-picotool.rules
    sudo udevadm control --reload-rules
    sudo udevadm trigger
    set -U PICOTOOL_SETUP TRUE
end
