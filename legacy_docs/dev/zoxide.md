# zoxide

## Overview

zoxide is a smarter cd command that tracks your most used directories and allows you to jump to them with minimal
typing. It learns from your habits and provides a faster way to navigate your filesystem. Think of it as cd with
intelligence - it remembers where you've been and makes it easy to get back there.

## Installation

- **Method**: Nix
- **Role Path**: `ansible/roles/dev/zoxide`

## Configuration

zoxide is automatically initialized in your `.zshrc` by the `zoxide` role. The initialization command
`eval "$(zoxide init zsh)"` is added to enable the `z` command and shell integration.

## Usage

zoxide provides several commands for smart directory navigation:

- `z <directory>` - Jump to a directory that matches the query (fuzzy matching)
- `z <dir1> <dir2>` - Jump to a directory matching multiple keywords
- `zi <directory>` - Interactive directory selection with fzf
- `zoxide query <directory>` - Query the database for matching directories
- `zoxide add <directory>` - Manually add a directory to the database
- `zoxide remove <directory>` - Remove a directory from the database

### Examples

```bash
# After visiting /home/user/Projects/my-awesome-project a few times
z awesome          # Jumps to /home/user/Projects/my-awesome-project
z proj awe         # Also works with multiple keywords

# Interactive selection when multiple matches exist
zi proj            # Opens fzf with matching directories

# Query what directory would be selected
zoxide query proj
```

## How It Works

- zoxide tracks directories you visit using `cd`
- Each directory gets a score based on frequency and recency
- The `z` command jumps to the highest-scoring match
- No need to type full paths - partial matches work great

## Variables

| Variable                   | Description                                        |
| -------------------------- | -------------------------------------------------- |
| `nix_install_nix_packages` | List of Nix packages to install (`nixpkgs#zoxide`) |

## Dependencies

- Nix package manager
- zsh (shell initialization)
- fzf (optional, for interactive mode `zi`)
