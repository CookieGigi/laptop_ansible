# fd

## Overview

fd is a simple, fast, and user-friendly alternative to find. It provides sensible defaults, respects .gitignore files,
and uses a more intuitive syntax. Works great with fzf and Neovim telescope.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/fd`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/fd)

## Configuration

fd is primarily configured through command-line flags. Configuration can be set via environment variables or shell
aliases.

## Usage

fd is used for finding files and directories. Common commands:

- `fd pattern` - Find files matching pattern
- `fd -e py` - Find all Python files
- `fd -H pattern` - Include hidden files

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#fd`) |

## Dependencies

- Nix package manager
