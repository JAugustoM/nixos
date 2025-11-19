{ ... }:
{
  programs.nushell = {
    enable = true;

    configFile.source = ../include/nushell/config.nu;
    envFile.source = ../include/nushell/env.nu;
  };
}
