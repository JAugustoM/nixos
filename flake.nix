{
  description = "NixOS configuration";

  outputs =
    { self, ... }:
    let
      tackInputs = import ./.tack;
      inputs = tackInputs;
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
