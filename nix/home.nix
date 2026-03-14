{ config, pkgs, ... }:
{
  home.username = "recregt";
  home.homeDirectory = "/home/recregt";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    bat
    bottom
    cowsay
    delta
    direnv
    dust
    exiftool
    eza
    fd
    ffmpeg
    gdb
    gh
    imagemagick
    jq
    just
    micro
    mise
    pipx
    procs
    ripgrep
    tealdeer
    tokei
    unzip
    uv
    xh
    zoxide
  ];

  home.file = {
    ".bash_aliases".source = ../bash/.bash_aliases;
    ".bashrc".source = ../bash/.bashrc;
    ".config/starship.toml".source = ../starship/.config/starship.toml;
  };

  programs.nushell = {
    enable = true;
    configFile.source = ../nushell/config.nu;
    envFile.source = ../nushell/env.nu;
  };

  home.sessionVariables = {
    EDITOR = "micro";
  };

  programs.home-manager.enable = true;
}
