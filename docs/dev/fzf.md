# fzf

## Overview

fzf is a general-purpose command-line fuzzy finder. It's an interactive Unix filter for command-line that can be used with any list: files, command history, processes, hostnames, bookmarks, git commits, etc. Integrates seamlessly with Neovim.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/fzf`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/fzf)

## Configuration

fzf can be configured through environment variables like `FZF_DEFAULT_OPTS` and `FZF_DEFAULT_COMMAND`.

## Usage

fzf is used for interactive fuzzy searching. Common usage:
- `CTRL-R` - Search command history
- `CTRL-T` - Fuzzy find files
- `ALT-C` - Fuzzy find directories
- `vim $(fzf)` - Open file in vim after fuzzy selection

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#fzf`) |

## Dependencies

- Nix package manager
