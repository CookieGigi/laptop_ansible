# KDE Config

## Overview

This role configures KDE by importing dotfiles from a specified repository.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`/ansible/roles/config/kde_config`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/config/kde_config)

## Configuration

- **Dotfiles Import**: Uses the `add_dotfiles_from_repo` role to import KDE configuration files from a Git repository.

## Usage

This role is used to set up and configure KDE with predefined settings.

## Variables

| Variable | Description |
|----------|-------------|
| `dotfile_repo` | URL of the dotfiles repository (`https://github.com/CookieGigi/kdeconfig.git`) |
| `dotfile_name` | Name of the dotfiles directory (`kdeconfig`) |
| `dotfile_repo_dir` | Directory within the repository containing dotfiles (`dotfiles`) |

## Dependencies

- `add_dotfiles_from_repo` role
