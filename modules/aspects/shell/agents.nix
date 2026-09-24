{
  den.aspects.shell.agents = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        uv
      ];

      programs = {
        antigravity-cli = {
          enable = true;
          enableMcpIntegration = true;
        };

        mcp = {
          enable = true;
          servers = {
            nixos = {
              command = "uvx";
              args = [ "mcp-nixos" ];
            };
          };
        };
      };
    };
  };
}
