# tree

## Overview

tree is a recursive directory listing program that produces a depth-indented listing of files. It's useful for visualizing project structure and understanding directory hierarchies.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/tree`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/tree)

## Configuration

tree is configured through command-line flags.

## Usage

tree is used for displaying directory structures. Common commands:
- `tree` - Display directory tree
- `tree -L 2` - Limit depth to 2 levels
- `tree -a` - Show hidden files
- `tree -I 'node_modules|.git'` - Ignore specific directories

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#tree`) |

## Dependencies

- Nix package manager
