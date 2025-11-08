# bat

## Overview

bat is a cat clone with syntax highlighting and Git integration. It supports automatic paging and shows file
modifications. Perfect for previewing files with fzf and in terminal workflows.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/bat`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/bat)

## Configuration

bat can be configured through `~/.config/bat/config`. Themes and syntax definitions can be customized.

## Usage

bat is used for viewing file contents with syntax highlighting. Common commands:

- `bat file.py` - Display file with syntax highlighting
- `bat file1.py file2.py` - View multiple files
- `bat --style=numbers,changes file.py` - Show line numbers and git changes

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#bat`) |

## Dependencies

- Nix package manager
