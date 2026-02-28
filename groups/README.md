# Package Groups

This directory contains group definitions for the new userspace-first architecture. Each YAML file defines a logical group of packages that can be installed together.

## Group Definition Schema

```yaml
name: "Group Name"
description: "What this group provides"
requires: [list, of, dependencies]  # Other groups this depends on

packages:
  nix: []      # Nix packages (nixpkgs#<name>)
  flatpak: []  # Flatpak application IDs
  pipx: []     # Python packages via pipx
  cargo: []    # Rust packages via cargo
  npm: []      # Node.js packages via npm
  apt: []      # System packages (requires sudo)

conditional:
  - when: condition_name
    packages:
      nix: []
      # etc

post_install_message: "Optional message after install"
```

## Available Groups

### Core (1)
- **core** - Essential CLI tools, terminal utilities, and power management
  - Includes: ripgrep, fd, fzf, zoxide, bat, eza, jq, yq, shellcheck, tree, tmux, zsh
  - Also: alacritty (terminal), tlp (power management), tmux_config

### Development (3)
- **dev-base** - Editors, Git tools, linters, formatters, LSPs, and Lua development
  - Requires: core
  - Includes: neovim, lazygit, gh, linters, LSP servers, Lua tools
- **dev-rust** - Rust toolchain, LSP, debugger, WASM tools
  - Requires: core, dev-base
- **dev-python** - Python linters, formatters, type checkers, LSP
  - Requires: core, dev-base

### Infrastructure & Containers (6)
- **dev-k8s** - Kubernetes CLI tools (kubectl, helm)
  - Requires: core, dev-base
- **docker** - Docker container platform and Docker Compose
  - Requires: core
- **podman** - Podman container platform and Podman Compose
  - Requires: core
- **minikube** - Minikube local Kubernetes cluster
  - Requires: core, dev-base
- **k3d** - k3d lightweight Kubernetes in Docker
  - Requires: core, dev-base, docker
- **terraform** - Terraform, Terragrunt, and infrastructure tools
  - Requires: core, dev-base

### Gaming (1)
- **gaming** - Steam, Heroic Launcher, and gaming tools
  - Requires: core

### Individual Applications (6)
- **obsidian** - Obsidian note-taking app
  - Requires: core
- **proton** - Proton Pass password manager
  - Requires: core
- **darktable** - Darktable photo editor
  - Requires: core
- **inkscape** - Inkscape vector graphics editor
  - Requires: core

### Browsers (1)
- **web** - Firefox, LibreWolf, and Chromium browsers
  - Requires: core

### AI & Automation (2)
- **ai-tools** - AI assistants (opencode)
  - Requires: core, dev-base
- **gemini** - Google Gemini CLI
  - Requires: core, dev-base

### Meta Groups (2)
- **productivity** - Installs obsidian + proton groups
  - Requires: core, obsidian, proton
- **creative** - Installs darktable + inkscape groups
  - Requires: core, darktable, inkscape

### System & Configuration (2)
- **system-tools** - System administration and monitoring tools
  - Requires: core
- **desktop-config** - KDE Connect and desktop dotfiles
  - Requires: core

## Usage

Install a single application:
```bash
make install GROUP=obsidian
make install GROUP=proton
make install GROUP=darktable
```

Install a collection:
```bash
make install GROUP=productivity    # Installs obsidian + proton
make install GROUP=creative        # Installs darktable + inkscape
```

Install multiple groups:
```bash
make install GROUP=core,dev-base,obsidian,gemini
```

Remove a group:
```bash
make remove GROUP=obsidian
```

Show installed groups:
```bash
make status
```

## Creating Custom Groups

1. Create a new YAML file in this directory (e.g., `my-group.yml`)
2. Follow the schema above
3. Add packages to the appropriate package manager sections
4. Define dependencies in `requires` if needed
5. Run `make list` to see your new group

## Dependency Resolution

Groups can depend on other groups using the `requires` field:
- `dev-rust` requires `dev-base` and `core`
- `dev-base` requires `core`
- `k3d` requires `docker`
- `productivity` requires `obsidian` and `proton`
- Application groups require `core`

The system will automatically resolve and install dependencies in the correct order.

## Conditional Packages

Some packages are only installed when certain conditions are met:
- `has_nvidia` - System has NVIDIA GPU
- `is_laptop` - System is a laptop
- `has_desktop_env` - Desktop environment is installed
- `is_wayland` - Running on Wayland

Example:
```yaml
conditional:
  - when: has_nvidia
    packages:
      nix:
        - mangohud
```
