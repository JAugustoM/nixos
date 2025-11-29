{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    disko
    git
    nixos-facter
    veracrypt
  ];

  system.stateVersion = "25.11"; # Did you read the comment?
}
