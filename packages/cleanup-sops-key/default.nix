{
  writeShellApplication,
  bash,
  coreutils,
  util-linux,
  veracrypt,
  ...
}:

writeShellApplication {
  name = "cleanup-sops-key";
  runtimeInputs = [
    bash
    coreutils
    util-linux
    veracrypt
  ];

  text = ''
    #!${bash}/bin/bash
    set -e

    # --- Configuration ---
    USB_MNT_POINT="/mnt/usb"
    SECRET_MNT_POINT="/mnt/secrets"
    SOPS_KEY_PATH="/var/lib/sops/keys.txt"
    # ---------------------

    # Check for root
    if [ "$EUID" -ne 0 ]; then
      echo "Please run this script as root (or with sudo)."
      exit 1
    fi

    echo "--> Unmounting VeraCrypt volume..."
    if mountpoint -q "$SECRET_MNT_POINT"; then
        veracrypt -d "$SECRET_MNT_POINT"
    else
        echo "VeraCrypt volume already unmounted."
    fi

    echo "--> Unmounting USB partition..."
    if mountpoint -q "$USB_MNT_POINT"; then
        umount "$USB_MNT_POINT"
    else
        echo "USB partition already unmounted."
    fi

    echo "--> Removing key from installer RAM..."
    if [ -f "$SOPS_KEY_PATH" ]; then
        rm -f "$SOPS_KEY_PATH"
    else
        echo "Key already removed."
    fi

    echo "✅ Cleanup complete."
  '';
}
