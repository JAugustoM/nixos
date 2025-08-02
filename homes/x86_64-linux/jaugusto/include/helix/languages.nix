{
  language-server = {
    biome = {
      command = "biome";
      args = [ "lsp-proxy" ];
    };
    clangd = {
      args = [
        (
          "--query-driver="
          + "/nix/store/*gcc-arm-embedded*/bin/arm-none-eabi-gcc,"
          + "/nix/store/*gcc-arm-embedded*/bin/arm-none-eabi-g++"
        )
      ];
    };
    ltex-ls-plus.config = {
      ltex.language = "pt-BR";
      ltex.languageToolHttpServerUri = "http://localhost:8081/";
      ltex.completionEnabled = true;
    };
    rust-analyzer.config = {
      cargo = {
        features = "all";
      };
      check = {
        command = "clippy";
      };
    };
  };
  language = [
    {
      name = "c";
      auto-format = true;
    }
    {
      name = "cmake";
      auto-format = true;
    }
    {
      name = "cpp";
      auto-format = true;
    }
    {
      name = "css";
      auto-format = true;
    }
    {
      name = "fish";
      auto-format = true;
    }
    {
      name = "html";
      language-servers = [
        {
          name = "superhtml";
          except-features = [ "format" ];
        }
        "vscode-html-language-server"
      ];
      auto-format = true;
    }
    {
      name = "java";
      auto-format = true;
    }
    {
      name = "javascript";
      language-servers = [
        {
          name = "typescript-language-server";
          except-features = [ "format" ];
        }
        "biome"
      ];
      auto-format = true;
    }
    {
      name = "json";
      language-servers = [
        {
          name = "vscode-json-language-server";
          except-features = [ "format" ];
        }
        "biome"
      ];
      auto-format = true;
    }
    {
      name = "jsx";
      language-servers = [
        {
          name = "typescript-language-server";
          except-features = [ "format" ];
        }
        "biome"
      ];
      auto-format = true;
    }
    {
      name = "just";
      auto-format = true;
    }
    {
      name = "markdown";
      language-servers = [
        "markdown-oxide"
        "ltex-ls-plus"
      ];
    }
    {
      name = "nix";
      auto-format = true;
    }
    {
      name = "nu";
      auto-format = true;
    }
    {
      name = "python";
      auto-format = true;
    }
    {
      name = "rust";
      auto-format = true;
    }
    {
      name = "systemd";
      auto-format = true;
    }
    {
      name = "toml";
      auto-format = true;
    }
    {
      name = "tsx";
      language-servers = [
        {
          name = "typescript-language-server";
          except-features = [ "format" ];
        }
        "biome"
      ];
      auto-format = true;
    }
    {
      name = "typescript";
      language-servers = [
        {
          name = "typescript-language-server";
          except-features = [ "format" ];
        }
        "biome"
      ];
      auto-format = true;
    }
    {
      name = "xml";
      auto-format = true;
    }
    {
      name = "yaml";
      auto-format = true;
    }
  ];
}
