# stylua

## Overview

stylua is an opinionated Lua code formatter. It provides fast and consistent formatting for Lua code with minimal
configuration, similar to how Prettier works for other languages.

## Installation

- **Method**: Nix
- **Role Path**: `ansible/roles/dev/stylua`

## Configuration

Configure via `stylua.toml` or `.stylua.toml`. Set formatting preferences like column width, indentation type (spaces
vs tabs), and quote style.

## Usage

stylua is used for formatting Lua code files. Common commands:

- `stylua .` - Format all Lua files in current directory
- `stylua --check .` - Check formatting without changing files
- `stylua file.lua` - Format specific file
- `stylua --config-path stylua.toml .` - Use specific config file

## Variables

| Variable       | Description                                        |
| -------------- | -------------------------------------------------- |
| `nix_packages` | List of Nix packages to install (`nixpkgs#stylua`) |

## Dependencies

- Nix package manager
