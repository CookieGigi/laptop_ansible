# yaml-language-server

## Overview

yaml-language-server provides language server protocol (LSP) features for YAML files including auto-completion, validation, and schema support. Critical for working with Ansible playbooks and the 69+ YAML files in this project.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/yaml-language-server`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/yaml-language-server)

## Configuration

Configuration is done through your editor's LSP client (Neovim, OpenCode). Supports JSON Schema validation and custom schema associations.

## Usage

yaml-language-server runs automatically in the background when editing YAML files. Provides:
- Auto-completion for keys and values
- Schema validation
- Hover documentation
- Syntax checking
- Format on save

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#yaml-language-server`) |

## Dependencies

- Nix package manager
- LSP client in your editor
