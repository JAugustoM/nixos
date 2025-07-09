{ lib, ... }:
let
  inherit (lib) toUpper genAttrs;

  mkWifiProfile = name: {
    connection = {
      id = name;
      type = "wifi";
      autoconnect = true;
    };
    wifi = {
      mode = "infrastructure";
      ssid = "$" + "${toUpper name}_SSID";
    };
    wifi-security = {
      key-mgmt = "wpa-psk";
      psk = "$" + "${toUpper name}_PSK";
    };
    ipv4 = {
      method = "auto";
    };
    ipv6 = {
      method = "auto";
      addr-gen-mode = "stable-privacy";
    };
  };
in
{
  mkWifiProfiles = profiles: genAttrs profiles mkWifiProfile;
}
