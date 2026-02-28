# Command Reference

## Setup (Run Once)

| Command | Description |
|---------|-------------|
| `make bootstrap` | Install Nix, Flatpak, pipx (requires sudo) |
| `make setup` | Configure shell, terminal, fonts |

## Group Management

| Command | Description |
|---------|-------------|
| `make list` | Show available groups |
| `make install GROUP=<name>` | Install a group |
| `make remove GROUP=<name>` | Remove a group |
| `make status` | Show installed groups |

## Presets

| Command | Description |
|---------|-------------|
| `make presets` | List available presets |
| `make preset NAME=<name>` | Apply a preset |

## Common Groups

- **core** - Essential CLI tools (ripgrep, fzf, zoxide, etc)
- **dev-base** - Git, lazygit, development basics
- **dev-rust** - Rust toolchain + cargo plugins
- **dev-python** - Python dev tools + pipx packages
- **dev-k8s** - kubectl, helm, k9s
- **gaming** - Steam, Discord, gaming tools
- **productivity** - Obsidian, Zed, productivity apps
- **web** - Node.js, browsers, web dev tools

## Presets Explained

- **minimal** - Just core essentials
- **workstation** - Full dev environment
- **gaming-rig** - Gaming focused
- **laptop** - Laptop optimized with power saving
- **server** - Headless server setup
