$env.PATH = ($env.PATH | split row (char esep) | prepend $'($env.HOME)/.nix-profile/bin' | prepend '/nix/var/nix/profiles/default/bin' | prepend $'($env.HOME)/.local/bin')

if ($env.PWD == "/mnt/c/Users/recregt") {
    cd ~
}

let nu_conf = ($env.HOME | path join .config nushell)
if not ($nu_conf | path exists) { mkdir $nu_conf }
