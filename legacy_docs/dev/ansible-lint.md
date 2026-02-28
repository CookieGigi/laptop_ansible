# ansible-lint

## Overview

ansible-lint is a command-line tool for linting Ansible playbooks, roles, and collections. It checks for practices and
behavior that could potentially be improved. Essential for maintaining quality in this Ansible-based project.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/ansible-lint`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/ansible-lint)

## Configuration

ansible-lint can be configured via `.ansible-lint` file in the project root. Configuration includes rule selection,
exclusions, and custom settings.

## Usage

ansible-lint is used for checking Ansible code quality. Common commands:

- `ansible-lint` - Lint all playbooks in current directory
- `ansible-lint playbooks/dev.yml` - Lint specific playbook
- `ansible-lint --fix` - Auto-fix issues where possible
- `ansible-lint --list-rules` - Show all available rules

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#ansible-lint`) |

## Dependencies

- Nix package manager
- Ansible
