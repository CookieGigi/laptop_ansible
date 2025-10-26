# LazyGit

## Overview

LazyGit is a simple terminal UI for Git commands, written in Go with the gocui library. It allows users to perform Git operations in a more user-friendly and efficient way.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/lazygit`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/lazygit)

## Configuration

LazyGit is configured through its own configuration file, typically located at `~/.config/jesseduffield/lazygit/config.yml`.

## Usage

LazyGit is used for performing Git operations such as committing, pushing, pulling, and resolving merge conflicts.

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#lazygit`) |

## Dependencies

- Nix package manager