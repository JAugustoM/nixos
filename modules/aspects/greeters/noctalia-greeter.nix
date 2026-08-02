{ inputs, ... }:
{
  flake-file.inputs = {
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
    };
  };
  den.aspects.greeters.noctalia-greeter = {
    nixos = {
      imports = [
        inputs.noctalia-greeter.nixosModules.default
      ];

      programs.noctalia-greeter.enable = true;
    };
  };
}
