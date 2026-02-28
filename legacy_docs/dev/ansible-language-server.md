# ansible-language-server

## Overview

The Ansible Language Server provides LSP (Language Server Protocol) features for Ansible files including auto-completion, hover documentation, diagnostics, and goto definitions. Essential for working with the 100+ Ansible files in this project.

## Installation

- **Method**: npm (global)
- **Role Path**: `ansible/roles/dev/ansible-language-server`

## Configuration

Configure via your editor's LSP client (Neovim, OpenCode). The language server automatically detects Ansible files and provides intelligent suggestions based on the Ansible module documentation.

## Usage

The Ansible Language Server runs automatically in the background when editing Ansible YAML files. Provides:

- Auto-completion for Ansible modules and their parameters
- Hover documentation for modules and keywords
- Diagnostics for syntax errors and deprecated modules
- Goto definition for roles and tasks
- Validation against Ansible schemas

## Variables

| Variable              | Description                                             |
| --------------------- | ------------------------------------------------------- |
| `npm_install_package` | npm package to install (`@ansible/ansible-language-server`) |

## Dependencies

- npm package manager
- LSP client in your editor
