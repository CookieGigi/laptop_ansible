# GitHub CLI (gh)

## Overview

GitHub CLI brings GitHub to your terminal. It allows you to manage pull requests, issues, repositories, and more from
the command line. OpenCode uses this tool for creating pull requests and managing GitHub workflows.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/gh`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/gh)

## Configuration

After installation, authenticate with `gh auth login`. Configuration is stored in `~/.config/gh/`.

## Usage

gh is used for GitHub operations from the terminal. Common commands:

- `gh pr create` - Create a pull request
- `gh pr list` - List pull requests
- `gh issue create` - Create an issue
- `gh repo view` - View repository details

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#gh`) |

## Dependencies

- Nix package manager
