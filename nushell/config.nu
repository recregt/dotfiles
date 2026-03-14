source ~/.cache/starship/init.nu
source ~/.config/nushell/zoxide.nu
source ~/.config/nushell/mise.nu

alias ls = eza --icons --group-directories-first
alias ll = eza -lah --icons --group-directories-first --git
alias la = eza -a --icons --group-directories-first
alias lt = eza --tree --icons --level 2
alias ltt = eza --tree --icons --level 3

alias cat = bat --paging=never
alias catp = bat
alias grep = rg
alias find = fd
alias du = dust
alias top = btm
alias ps = procs
alias loc = tokei
alias http = xh
alias help = tldr
alias diff = delta

alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..

export def "nix list" [] {
    ^nix profile list --json
    | from json
    | get elements
    | transpose tool data
    | insert version { |row|
        $row.data.storePaths.0
        | split row "-"
        | where { |it| $it =~ '^[0-9]' }
        | first
    }
    | select tool version
}

export def "nix install" [...pkgs: string] {
    $pkgs | each { |pkg| ^nix profile add $"nixpkgs#($pkg)" }
}

export def "nix uninstall" [...pkgs: string] {
    $pkgs | each { |pkg| ^nix profile remove $pkg }
}

export def "nix update" [] {
    ^nix profile upgrade '.*'
}

$env.config = {
    show_banner: false
}
