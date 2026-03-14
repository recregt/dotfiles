$env.PATH = ($env.PATH | split row (char esep) | prepend $'($env.HOME)/.nix-profile/bin' | prepend '/nix/var/nix/profiles/default/bin' | prepend $'($env.HOME)/.local/bin')

if ($env.PWD == "/mnt/c/Users/recregt") {
    cd ~
}

let starship_cache = ($env.HOME | path join .cache starship)
if not ($starship_cache | path exists) { mkdir $starship_cache }

let nu_conf = ($env.HOME | path join .config nushell)
if not ($nu_conf | path exists) { mkdir $nu_conf }

touch ($nu_conf | path join zoxide.nu)
touch ($nu_conf | path join mise.nu)

starship init nu | save -f ($starship_cache | path join init.nu)
zoxide init nushell | save -f ($nu_conf | path join zoxide.nu)

if (which mise | is-not-empty) {
    ^mise activate nu | save -f ($nu_conf | path join mise.nu)
}
