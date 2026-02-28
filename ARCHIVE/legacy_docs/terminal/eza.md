# eza

## Overview

eza is a modern replacement for ls with colors, icons, and Git integration. It's a maintained fork of exa with improved
features and better performance.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/eza`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/eza)

## Configuration

eza is configured through shell aliases that are automatically added to your `.zshrc` by the `add_alias` role.

### Configured Aliases

The following aliases are set up in `ansible/playbooks/basic.yml`:

- `ls` → `eza --icons --group-directories-first`
- `ll` → `eza -la --icons --group-directories-first --git`
- `lt` → `eza --tree --icons --group-directories-first`

## Usage

eza is used for listing directory contents with enhanced visualization. Common commands:

- `eza -la` - Long format with all files
- `eza --tree` - Tree view
- `eza --git` - Show git status
- `eza --icons` - Display file icons

## Variables

| Variable       | Description                                     |
| -------------- | ----------------------------------------------- |
| `nix_packages` | List of Nix packages to install (`nixpkgs#eza`) |

## Dependencies

- Nix package manager
