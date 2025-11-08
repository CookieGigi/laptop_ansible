# ripgrep (rg)

## Overview

ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern. It's
extremely fast and respects .gitignore files by default. Essential for OpenCode and Neovim workflows.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/ripgrep`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/ripgrep)

## Configuration

ripgrep can be configured via `~/.ripgreprc` or through command-line flags.

## Usage

ripgrep is used for fast text searching across files and directories. Common commands:

- `rg "pattern"` - Search for pattern
- `rg "pattern" -t py` - Search only Python files
- `rg "pattern" --hidden` - Include hidden files

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#ripgrep`) |

## Dependencies

- Nix package manager
