# lua-language-server

## Overview

lua-language-server is a language server for Lua providing code completion, diagnostics, and other LSP features.
Essential for configuring Neovim with Lua and working with Lua scripts.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/lua-language-server`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/lua-language-server)

## Configuration

Configure through your editor's LSP client. Can be customized with workspace settings for Neovim-specific Lua
development.

## Usage

lua-language-server runs automatically when editing Lua files. Provides:

- Code completion
- Function signatures
- Hover documentation
- Go-to-definition
- Find references
- Diagnostics and type checking
- Neovim API support

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#lua-language-server`) |

## Dependencies

- Nix package manager
- LSP client in your editor
