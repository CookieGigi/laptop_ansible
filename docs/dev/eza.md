# eza

## Overview

eza is a modern replacement for ls with colors, icons, and Git integration. It's a maintained fork of exa with improved
features and better performance.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/eza`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/eza)

## Configuration

eza is configured through command-line flags or shell aliases in your `.zshrc` or `.bashrc`.

## Usage

eza is used for listing directory contents with enhanced visualization. Common commands:

- `eza -la` - Long format with all files
- `eza --tree` - Tree view
- `eza --git` - Show git status
- `eza --icons` - Display file icons

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#eza`) |

## Dependencies

- Nix package manager
