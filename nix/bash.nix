{ ... }:
{
  programs.bash = {
    enable = true;
    historySize = 5000;
    historyFileSize = 10000;
    historyControl = [ "ignoreboth" ];
    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza -lah --icons --group-directories-first --git";
      la = "eza -a --icons --group-directories-first";
      lt = "eza --tree --icons --level=2";
      ltt = "eza --tree --icons --level=3";
      cat = "bat --paging=never";
      catp = "bat";
      grep = "rg";
      find = "fd";
      du = "dust";
      top = "btm";
      ps = "procs";
      loc = "tokei";
      http = "xh";
      help = "tldr";
      diff = "delta";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      mkdir = "mkdir -pv";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -iv";
      path = "echo $PATH | tr ':' '\n'";
      reload = "source ~/.bashrc && echo '✔ bashrc reloaded'";
    };
    initExtra = ''
      [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
      [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

      if [[ "$PWD" == "/mnt/c/Users/recregt" ]]; then
          cd ~
      fi
    '';
  };
}