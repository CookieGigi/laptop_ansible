# mkpasswd

## Overview

mkpasswd is a password hashing utility that generates encrypted passwords using various hashing algorithms (MD5, SHA-256, SHA-512). It's useful for generating password hashes for /etc/shadow, htpasswd files, and testing authentication systems.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/terminal/mkpasswd`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/terminal/mkpasswd)

## Configuration

mkpasswd is configured through command-line flags.

## Usage

mkpasswd is used for generating password hashes. Common commands:

- `mkpasswd` - Generate password hash (prompts for password)
- `mkpasswd -m sha-512` - Use SHA-512 algorithm (recommended)
- `mkpasswd -m help` - List available hashing algorithms
- `echo 'password' | mkpasswd -s -m sha-512` - Pipe password input
- `mkpasswd -m sha-512 password` - Hash password directly (less secure, visible in history)

## Variables

| Variable | Description |
|----------|-------------|
| `nix_install_nix_packages` | List of Nix packages to install (`nixpkgs#mkpasswd`) |

## Dependencies

- Nix package manager
