# dotfiles

My personal dotfiles for WSL2 (Ubuntu) managed with [Home Manager](https://github.com/nix-community/home-manager) and [Nix](https://nixos.org/).

## Shell

[Nushell](https://www.nushell.sh/) as the default shell with [Starship](https://starship.rs/) prompt.

## Tools

| Tool | Purpose |
|------|---------|
| [eza](https://github.com/eza-community/eza) | modern `ls` |
| [bat](https://github.com/sharkdp/bat) | modern `cat` |
| [fd](https://github.com/sharkdp/fd) | modern `find` |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | modern `grep` |
| [dust](https://github.com/bootandy/dust) | modern `du` |
| [bottom](https://github.com/ClementTsang/bottom) | modern `top` |
| [delta](https://github.com/dandavison/delta) | better git diffs |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | smarter `cd` |
| [direnv](https://direnv.net/) | per-directory env vars |
| [mise](https://mise.jdx.dev/) | runtime version manager |
| [gh](https://cli.github.com/) | GitHub CLI |
| [just](https://github.com/casey/just) | command runner |
| [xh](https://github.com/ducaale/xh) | HTTP client |
| [uv](https://github.com/astral-sh/uv) | Python package manager |
| [micro](https://micro-editor.github.io/) | terminal text editor |

## Structure

```
dotfiles/
├── flake.nix          # nix flake entry point
├── flake.lock         # pinned dependency versions
├── nix/
│   ├── home.nix       # main entry point
│   ├── packages.nix   # installed packages
│   ├── bash.nix       # bash config
│   ├── nushell.nix    # nushell config
│   ├── programs.nix   # starship, zoxide, direnv, mise, gh, micro
│   └── git.nix        # git config
├── nushell/
│   ├── config.nu      # nushell config
│   └── env.nu         # nushell env
└── starship/
    └── starship.toml  # starship prompt config (read by nix via fromTOML)
```

## Bootstrap

### 1. Install Nix

```bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

### 2. Enable Flakes

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### 3. Clone dotfiles

```bash
git clone https://github.com/recregt/dotfiles ~/dotfiles
```

### 4. Apply

```bash
cd ~/dotfiles
nix run home-manager/master -- switch --flake .#recregt
```

### 5. Set Nushell as default shell

```bash
which nu | sudo tee -a /etc/shells
chsh -s $(which nu)
```

## Daily Usage

| Command | Description |
|---------|-------------|
| `nix apply` | apply home-manager changes |
| `nix flake update` | update pinned dependencies |
| `hm generations` | list all generations |
| `hm switch --rollback` | roll back to previous generation |
| `nix list` | list installed packages with versions |
| `hm expire-generations "-30 days"` | clean up old generations |
