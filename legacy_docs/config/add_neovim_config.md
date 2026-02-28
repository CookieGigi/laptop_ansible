# Add Neovim Configuration

## Overview

This role manages Neovim configuration by creating a configuration directory,
optionally cloning a configuration repository, and setting up a shell alias
with the `NVIM_APPNAME` environment variable to use specific Neovim
configurations.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`./ansible/roles/config/add_neovim_config`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/config/add_neovim_config)

## Configuration

- **Config Path**: Configurable Neovim configuration directory
  (default: `~/.config/nvim`)
- **Repository**: Optional Git repository for Neovim configuration
- **Alias**: Creates shell alias using `NVIM_APPNAME` environment
  variable

## Usage

This role allows you to manage multiple Neovim configurations by:

1. Creating a dedicated configuration directory
2. Optionally cloning a configuration from a Git repository
3. Setting up an alias that uses `NVIM_APPNAME` to point to the specific
   configuration

The alias format is: `alias <name>="NVIM_APPNAME=<path> nvim"`

## Variables

| Variable                  | Description                                    | Default                                           |
| ------------------------- | ---------------------------------------------- | ------------------------------------------------- |
| `add_neovim_config_path`  | Path to the Neovim configuration directory     | `~/.config/nvim`                                  |
| `add_neovim_config_repo`  | URL of the Neovim config repository (optional) | `https://github.com/yourusername/nvim-config.git` |
| `add_neovim_config_alias` | Name of the shell alias to create              | `vim`                                             |

## Dependencies

- Git (if using repository clone feature)
- `add_alias` role (for creating shell aliases)
- Neovim installed on the system

## Example

To use this role with custom values:

```yaml
- name: Setup custom Neovim configuration
  ansible.builtin.include_role:
    name: add_neovim_config
  vars:
    add_neovim_config_path: ~/my-nvim-config
    add_neovim_config_repo: https://github.com/myuser/my-nvim-config.git
    add_neovim_config_alias: mynvim
```

This creates: `alias mynvim="NVIM_APPNAME=~/my-nvim-config nvim"`
