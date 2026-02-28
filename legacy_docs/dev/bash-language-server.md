# bash-language-server

## Overview

bash-language-server is a language server for Bash that provides LSP features for shell scripts. Works alongside
shellcheck to provide comprehensive shell scripting support.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/bash-language-server`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/bash-language-server)

## Configuration

Configure through your editor's LSP client. Integrates with shellcheck for enhanced diagnostics.

## Usage

bash-language-server runs automatically when editing shell scripts. Provides:

- Code completion for commands and variables
- Hover documentation
- Go-to-definition for functions
- Symbol outline
- Diagnostics via shellcheck integration
- Function signature help

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#nodePackages.bash-language-server`) |

## Dependencies

- Nix package manager
- LSP client in your editor
- shellcheck (for diagnostics)
