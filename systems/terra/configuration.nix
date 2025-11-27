{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    disko
    git
    nixos-facter
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
