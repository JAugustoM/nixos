{
  writeShellApplication,
  bash,
  coreutils,
  util-linux,
  veracrypt,
  ...
}:

writeShellApplication {
  name = "setup-sops-key";
  runtimeInputs = [
    bash
    coreutils
    util-linux
    veracrypt
  ];

  text = ''
    set -e # Exit immediately if a command fails

    # --- Configuration ---
    USB_MNT_POINT="/mnt/usb"
    SECRET_MNT_POINT="/mnt/secrets"
    SOPS_KEY_PATH="/var/lib/sops/keys.txt"
    EXPECTED_LABEL="Ventoy" # Default Ventoy label, adjust if yours is different
    # ---------------------

    # Check for root
    if [ "$EUID" -ne 0 ]; then
      echo "Please run this script as root (or with sudo)."
      exit 1
    fi

    # Check for correct arguments
    if [ "$#" -ne 2 ]; then 
      echo "Usage: $0 <VERACRYPT_FILE_ON_USB> <AGE_KEY_IN_CONTAINER>"
      echo ""
      echo "Example: $0 secrets/my-container.vc keys/sops-age.key"
      echo ""
      echo "Note: Assumes the USB partition is labeled '$EXPECTED_LABEL'."
      echo "If not, find the label with 'lsblk -f' and edit the script or mount manually."
      exit 1
    fi

    # Removed USB_PARTITION argument
    VERACRYPT_FILE="$1"
    AGE_KEY_PATH="$2"

    echo "--> Mounting USB partition with label '$EXPECTED_LABEL'..."
    mkdir -p "$USB_MNT_POINT"

    if ! mount LABEL="$EXPECTED_LABEL" "$USB_MNT_POINT"; then
        echo "Error: Failed to mount partition with label '$EXPECTED_LABEL'."
        echo "Check if the label is correct using 'lsblk -f'."
        exit 1
    fi

    VERACRYPT_FILE_FULL_PATH="$USB_MNT_POINT/$VERACRYPT_FILE"
    if [ ! -f "$VERACRYPT_FILE_FULL_PATH" ]; then
        echo "Error: VeraCrypt file not found at $VERACRYPT_FILE_FULL_PATH"
        echo "Unmounting USB..."
        umount "$USB_MNT_POINT"
        exit 1
    fi

    echo "--> Mounting VeraCrypt file (will prompt for password)..."
    mkdir -p "$SECRET_MNT_POINT"
    veracrypt "$VERACRYPT_FILE_FULL_PATH" "$SECRET_MNT_POINT"

    AGE_KEY_FULL_PATH="$SECRET_MNT_POINT/$AGE_KEY_PATH"
    if [ ! -f "$AGE_KEY_FULL_PATH" ]; then
        echo "Error: Age key not found at $AGE_KEY_FULL_PATH"
        echo "Unmounting VeraCrypt and USB..."
        veracrypt -d "$SECRET_MNT_POINT" || true # Allow failure if already unmounted
        umount "$USB_MNT_POINT"
        exit 1
    fi

    echo "--> Copying age key to $SOPS_KEY_PATH..."
    mkdir -p "$(dirname "$SOPS_KEY_PATH")"
    cp "$AGE_KEY_FULL_PATH" "$SOPS_KEY_PATH"

    echo ""
    echo "✅ Success! SOPS key is ready at $SOPS_KEY_PATH."
    echo "You can now run 'nixos-install'."
    echo "When finished, run 'cleanup-sops-key' before rebooting."
  '';
}
