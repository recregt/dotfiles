case $- in
    *i*) ;;
      *) return;;
esac

if [ -f "$HOME/.nix-profile/share/blesh/ble.sh" ]; then
    source "$HOME/.nix-profile/share/blesh/ble.sh"
fi

export PATH="$HOME/.local/bin:$PATH"

HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if command -v mise &>/dev/null; then
    eval "$(mise activate bash)"
fi

if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

eval "$(zoxide init bash)"
eval "$(atuin init bash)"

if [[ "$PWD" == "/mnt/c/Users/recregt" ]]; then
    cd ~
fi
