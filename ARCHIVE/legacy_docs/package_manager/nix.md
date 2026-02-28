# Nix

## Overview

Nix is a powerful package manager for Linux and other Unix systems that makes package management reliable and
reproducible. This role installs Nix packages for the user.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/package_manager/nix`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/package_manager/nix)

## Configuration

- **Packages**: Installs specified Nix packages for the user.

## Usage

This role is used to manage Nix packages for the user.

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (e.g., `nixpkgs#hello`) |

## Dependencies

- Nix package manager
