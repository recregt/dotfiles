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
alias hm = home-manager

alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..

export def "nix list" [] {
    let wanted = [bat btm cowsay delta direnv dust eza fd ffmpeg gdb gh exiftool magick jq just micro mise nu pipx procs rg stow tldr tokei unzip uv xh zoxide]
    
    let hm_path = (^nix profile list --json
        | from json
        | get elements.home-manager-path.storePaths.0)
    
    ^ls -la $"($hm_path)/bin/"
    | lines
    | where { |it| $it =~ " -> " }
    | each { |it|
        let binary = ($it | split row " -> " | first | split row " " | last | str trim)
        let store = ($it | split row " -> " | last | str trim)
        let pkg = ($store | split row "/" | get 3 | split row "-")
        let version = ($pkg | skip 1 | where { |p| $p =~ '^[0-9]' } | first | default "?")
        {tool: $binary, version: $version}
    }
    | where { |it| $it.tool in $wanted }
    | sort-by tool
}

export def "nix install" [...pkgs: string] {
    print $"Add ($pkgs) to ~/dotfiles/nix/home.nix and run 'nix apply'"
}

export def "nix apply" [] {
    ^home-manager switch
}

$env.config = {
    show_banner: false
}
