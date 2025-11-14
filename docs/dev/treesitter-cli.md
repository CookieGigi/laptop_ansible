# treesitter-cli

## Overview

Tree-sitter is a parser generator tool and incremental parsing library. The CLI provides commands for developing,
testing, and using Tree-sitter grammars. It's essential for syntax highlighting, code navigation, and building
language tools.

## Installation

- **Method**: Nix
- **Role Path**: `ansible/roles/dev/treesitter-cli`

## Configuration

Tree-sitter uses `grammar.js` files to define language grammars. Configure parsers in your editor's configuration
(e.g., Neovim's treesitter config).

## Usage

tree-sitter CLI is used for grammar development and testing. Common commands:

- `tree-sitter generate` - Generate parser from grammar.js
- `tree-sitter parse <file>` - Parse a file and display syntax tree
- `tree-sitter test` - Run grammar tests
- `tree-sitter build-wasm` - Build grammar for web assembly
- `tree-sitter init-config` - Initialize configuration

## Variables

| Variable                   | Description                                             |
| -------------------------- | ------------------------------------------------------- |
| `nix_install_nix_packages` | List of Nix packages to install (`nixpkgs#tree-sitter`) |

## Dependencies

- Nix package manager
