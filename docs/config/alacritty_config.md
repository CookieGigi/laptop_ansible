# Alacritty Config

## Overview

This role configures Alacritty by importing dotfiles from a specified repository.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`/ansible/roles/config/alacritty_config`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/config/alacritty_config)

## Configuration

- **Dotfiles Import**: Uses the `add_dotfiles_from_repo` role to import Alacritty configuration files from a Git repository.

## Usage

This role is used to set up and configure Alacritty with predefined settings.

## Variables

| Variable | Description |
|----------|-------------|
| `dotfile_repo` | URL of the dotfiles repository (`https://github.com/CookieGigi/alacritty_config.git`) |
| `dotfile_name` | Name of the dotfiles directory (`alacritty`) |
| `dotfile_repo_dir` | Directory within the repository containing dotfiles (`dotfiles`) |

## Dependencies

- `add_dotfiles_from_repo` role
