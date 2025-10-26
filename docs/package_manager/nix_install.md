# Nix Install

## Overview

This role installs the Nix package manager in user space without a daemon.

## Installation

- **Method**: Shell Script
- **Role Path**: [`/ansible/roles/package_manager/nix_install`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/package_manager/nix_install)

## Configuration

- **Nix Installation**: Installs Nix in user space.
- **Source Configuration**: Adds Nix profile path to the shell configuration.

## Usage

This role is used to set up the Nix package manager for the user.

## Variables

| Variable | Description |
|----------|-------------|
| `nix_install_url` | URL for the Nix installation script |
| `nix_profil_path` | Path to the Nix profile (`~/.nix-profile/etc/profile.d/nix.sh`) |

## Dependencies

- `curl`