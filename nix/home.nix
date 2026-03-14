{ config, pkgs, ... }:
{
  imports = [
    ./packages.nix
    ./bash.nix
    ./nushell.nix
    ./programs.nix
    ./git.nix
  ];

  home.username = "recregt";
  home.homeDirectory = "/home/recregt";
  home.stateVersion = "25.11";
  home.sessionVariables.EDITOR = "micro";
  programs.home-manager.enable = true;
}