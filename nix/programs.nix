{ ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  home.file = {
    ".config/starship.toml".source = ../starship/starship.toml;
  };
}