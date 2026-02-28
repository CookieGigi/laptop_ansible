# Add Dotfiles from Repository

## Overview

This role clones or updates a dotfiles repository and uses GNU Stow to manage the symlinks for the dotfiles. It is
useful for maintaining configuration files across multiple systems.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`/ansible/roles/config/add_dotfiles_from_repo`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/config/add_dotfiles_from_repo)

## Configuration

- **Dotfiles Path**: `~/.dotfiles`
- **Repository**: Cloned or updated from the specified Git repository
- **Stow Command**: Used to create symlinks for dotfiles

## Usage

This role is used to manage dotfiles by cloning a repository and using GNU Stow to create symlinks for the dotfiles in
the user's home directory.

## Variables

| Variable | Description |
|----------|-------------|
| `dotfile_path` | Path to the dotfiles directory (`~/.dotfiles`) |
| `dotfile_repo` | URL of the dotfiles repository (`https://github.com/yourusername/bashrc.git`) |
| `dotfile_name` | Name of the dotfiles directory (`.bashrc`) |
| `dotfile_repo_dir` | Directory within the repository containing dotfiles (`dotfiles`) |

## Dependencies

- Git
- GNU Stow
