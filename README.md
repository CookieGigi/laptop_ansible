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
- **Modular Design**: Organized roles for different system aspects
- **Dotfiles Management**: Version-controlled configuration files
- **Idempotent Setup**: Safe to re-run multiple times
- **Selective Application**: Apply only needed configurations

## Project Structure

```
ansible/
├── group_vars/
│   └── all.yml          # Global variables
├── playbooks/          # Main playbooks
│   ├── ai.yml          # AI-related configurations
│   ├── app.yml          # Application installations
│   ├── basic.yml        # Basic system setup
│   ├── config.yml       # System configurations
│   ├── logwatch.yml     # Log monitoring setup
│   └── nvidia.yml       # NVIDIA driver setup
├── roles/              # Ansible roles
│   ├── app/            # Application roles
│   │   ├── firefox/      # Firefox browser
│   │   ├── heroic-launcher/# Game launcher
│   │   ├── kde-connect/  # KDE Connect
│   │   ├── librewolf/    # Privacy-focused browser
│   │   ├── obsidian/     # Note-taking app
│   │   ├── proton-pass/  # Password manager
│   │   └── steam/        # Steam platform
│   ├── config/         # Configuration roles
│   ├── dev/            # Development tool roles
│   ├── driver/         # Driver roles
│   ├── monitoring/     # Monitoring roles
│   ├── package_manager/# Package manager roles
│   ├── terminal/        # Terminal-related roles
│   └── user/           # User management roles
└── docs/               # Documentation
    └── apps/           # Individual app documentation
```

## Requirements

### Core Requirements
- Ansible 2.9+ (tested with 2.15)
- Linux system (primarily tested on Debian/Ubuntu)
- Python 3.8+

### Package Managers
- Flatpak (for GUI applications)
- Nix (for CLI tools and development environments)
- Optional: npm (for JavaScript-based tools)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/system_maintain.git
   cd system_maintain
   ```

2. Install Ansible if not already installed:
   ```bash
   sudo apt update
   sudo apt install ansible
   ```

3. Review and customize the inventory file:
   ```bash
   cp inventory.ini.example inventory.ini
   # Edit inventory.ini to match your environment
   ```

## Usage

### Running Playbooks

To apply all configurations:
```bash
ansible-playbook -i inventory.ini playbooks/basic.yml
```

To apply specific configurations:
```bash
# For application setup
ansible-playbook -i inventory.ini playbooks/app.yml

# For development environment
ansible-playbook -i inventory.ini playbooks/dev.yml

# For NVIDIA drivers
ansible-playbook -i inventory.ini playbooks/nvidia.yml
```

### Running Specific Roles

To run a specific role:
```bash
ansible-playbook -i inventory.ini playbooks/test.yml --tags <role_name>
```

Example:
```bash
ansible-playbook -i inventory.ini playbooks/test.yml --tags librewolf
```

### Testing Changes

To check syntax before running:
```bash
ansible-playbook --syntax-check playbooks/<playbook>.yml
```

To lint your playbooks:
```bash
ansible-lint
```

## Customization

1. **Variables**: Modify `group_vars/all.yml` for global settings
2. **Roles**: Add or modify roles in the `roles/` directory
3. **Playbooks**: Create new playbooks in the `playbooks/` directory

### Adding New Applications

1. Create a new role under `roles/app/`
2. Define tasks in `tasks/main.yml`
3. Add any required variables in `vars/main.yml`
4. Include the role in the appropriate playbook

## Dotfiles Management

This project includes dotfiles for:
- Alacritty terminal emulator
- KDE Plasma configuration

To use these dotfiles:
1. Navigate to the `dotfiles/` directory
2. Use GNU Stow to manage the dotfiles:
   ```bash
   cd dotfiles/alacritty
   stow -t ~ .
   ```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## License

[MIT License](LICENSE)