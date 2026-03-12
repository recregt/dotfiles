alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --icons --level=2'
alias ltt='eza --tree --icons --level=3'

alias cat='bat --paging=never'
alias catp='bat'

alias grep='rg'
alias find='fd'
alias du='dust'
alias sdr='sd'
alias top='btm'
alias htop='btm'
alias ps='procs'
alias loc='tokei'
alias http='xh'
alias help='tldr'
alias diff='delta'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias path='echo $PATH | tr ":" "\n"'
alias reload='source ~/.bashrc && echo "✔ bashrc is reloaded"'

nix() {
  case "$1" in
    install)   shift; for pkg in "$@"; do command nix profile add "nixpkgs#$pkg"; done ;;
    uninstall) shift; for pkg in "$@"; do command nix profile remove "$pkg"; done ;;
    list)      command nix profile list --json | jq -r '.elements | to_entries[] | [.key, (.value.storePaths[0] | split("-") | map(select(test("^[0-9]"))) | .[0])] | @tsv' | awk '{t[NR]=$1; v[NR]=$2; l=length($1); if(l>m) m=l} END {w=m+4; p="\033[3;35m"; r="\033[0m"; b="\033[34m"; g="\033[32m"; fh="%s%-" w "s %-15s%s\n"; fr="%s%-" w "s%s %s%-15s%s\n"; printf fh, p, "Tool", "Version", r; for(i=1; i<=NR; i++) printf fr, b, t[i], r, g, v[i], r}' ;;
    update)    command nix profile upgrade '.*' ;;
    run)       shift; command nix run "nixpkgs#$@" ;;
    shell)     shift; command nix shell "nixpkgs#$@" ;;
    search)    shift; command nix search nixpkgs "$@" ;;
    *)         command nix "$@" ;;
  esac
}
