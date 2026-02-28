# System Maintain

An Ansible-based **user-space** system configuration framework for setting up and maintaining my personal laptop environment.

## Overview

System Maintain automates the setup of my laptop configuration, settings, applications, and CLI tools - with a strong preference for user-space installations. The project uses:

- **Flatpak** for GUI applications
- **Nix** for CLI tools and development environments
- **Ansible** for configuration management

This ensures most installations stay within `/home` directory, maintaining system cleanliness and portability.

## Features

- **User-Space Focus**: Prioritizes installations in `/home` directory
- **Flatpak Integration**: Primary method for GUI application installation
- **Nix Environment**: Manages CLI tools and development dependencies
- **Group-Based Management**: Organized package groups for different use cases
- **State Tracking**: YAML-based state management for installed packages
- **Idempotent Setup**: Safe to re-run multiple times
- **Selective Application**: Install/remove specific package groups

## Project Structure

```
.
├── ansible/              # Ansible configuration
│   ├── inventory/        # Ansible inventory (state.yml)
│   └── playbooks/        # Main playbooks
│       ├── 00-system-bootstrap.yml
│       ├── 01-user-bootstrap.yml
│       └── 02-groups.yml
├── ARCHIVE/              # Archived legacy content
│   ├── legacy_docs/      # Old documentation
│   └── old/              # Previous Ansible implementation
├── config/               # Configuration files (.vale/)
├── docs/                 # Documentation
│   ├── migration-plan.md
│   ├── MIGRATION_TODO.md
│   └── TESTING.md
├── groups/               # Package group definitions (24 YAML files)
│   ├── core.yml
│   ├── dev-base.yml
│   ├── dev-rust.yml
│   ├── gaming.yml
│   └── ...
├── presets/              # Preset configurations (future)
├── Makefile              # CLI wrapper for common operations
├── LICENSE
└── README.md
```

## Requirements

### Core Requirements
- Ansible 2.9+ (tested with 2.15)
- Linux system (primarily tested on Debian/Ubuntu)
- Python 3.8+
- Make

### Package Managers
- Flatpak (for GUI applications)
- Nix (for CLI tools and development environments)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/system_maintain.git
   cd system_maintain
   ```

2. Run the bootstrap process:
   ```bash
   # Install package managers (requires root once)
   make bootstrap
   
   # Setup shell, terminal, and fonts (user space)
   make setup
   ```

## Usage

### Using the Makefile

The project provides a convenient Makefile interface:

```bash
# Show available commands
make help

# Install a package group
make install GROUP=dev-rust

# Remove a package group
make remove GROUP=gaming

# Apply a preset (when implemented)
make preset NAME=workstation
```

### Running Playbooks Directly

```bash
# System bootstrap (package managers)
ansible-playbook ansible/playbooks/00-system-bootstrap.yml

# User bootstrap (shell, terminal, fonts)
ansible-playbook ansible/playbooks/01-user-bootstrap.yml

# Install package groups
ansible-playbook ansible/playbooks/02-groups.yml
```

### Testing Changes

To check syntax before running:
```bash
ansible-playbook --syntax-check ansible/playbooks/<playbook>.yml
```

To lint your playbooks:
```bash
ansible-lint
```

## Available Groups

Run `make list` to see all available package groups:

- **core** - Essential system packages
- **dev-base** - Basic development tools
- **dev-rust** - Rust development environment
- **dev-python** - Python development environment
- **dev-k8s** - Kubernetes tools
- **gaming** - Gaming applications
- **web** - Web browsers and tools
- **ai-tools** - AI/ML development tools

## Customization

### Adding New Groups

1. Create a new YAML file in `groups/`
2. Define packages in the group:
   ```yaml
   # groups/my-group.yml
   name: my-group
   description: My custom package group
   packages:
     flatpak:
       - com.example.App
     nix:
       - my-tool
   ```

### Group Structure

Each group file supports:
- `name`: Group identifier
- `description`: Human-readable description
- `packages.flatpak`: Flatpak application IDs
- `packages.nix`: Nix package names
- `condition`: Optional conditional (e.g., `nvidia_gpu`, `is_laptop`)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## License

[MIT License](LICENSE)
