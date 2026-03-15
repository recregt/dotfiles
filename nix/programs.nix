{ config, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = builtins.fromTOML (builtins.readFile ../starship/starship.toml);
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.mise = {
    enable = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
      editor = config.home.sessionVariables.EDITOR;
      prompt = "enabled";
    };
  };

  programs.micro = {
    enable = true;
    settings = {
      tabsize = 2;
      tabstospaces = true;
      autosu = true;
    };
  };
}