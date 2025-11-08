# shellcheck

## Overview

ShellCheck is a static analysis tool for shell scripts. It finds bugs in your shell scripts and suggests improvements, helping you write more robust and portable scripts.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/shellcheck`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/shellcheck)

## Configuration

shellcheck can be configured via `.shellcheckrc` files or inline directives in scripts.

## Usage

shellcheck is used for linting shell scripts. Common commands:
- `shellcheck script.sh` - Check a script
- `shellcheck -x script.sh` - Follow sourced files
- `shellcheck -S warning script.sh` - Set minimum severity level

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#shellcheck`) |

## Dependencies

- Nix package manager
