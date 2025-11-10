# Neovim Dev Configuration

## Overview

This role sets up a dedicated Neovim development configuration using the
`add_neovim_config` role. It is specifically configured for development
purposes with a separate configuration directory.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`./ansible/roles/config/nvim_dev`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/config/nvim_dev)

## Configuration

- **Config Path**: `~/Project/neovim/base` (actual location)
- **NVIM_APPNAME**: `nvim_dev` (relative to `~/.config/`)
- **Alias**: `nvim_dev`
- **Repository**: Empty by default (can be configured)

## Usage

This role creates a separate Neovim configuration specifically for development
work. It uses the `add_neovim_config` role to:

1. Create the configuration directory at `~/Project/neovim/base`
2. Create a symbolic link from `~/.config/nvim_dev` to `~/Project/neovim/base`
3. Set up the alias `nvim_dev` to launch Neovim with this configuration

The created alias is:
`alias nvim_dev="NVIM_APPNAME=nvim_dev nvim"`

Note: `NVIM_APPNAME` is a relative path to `~/.config/`, so `nvim_dev` refers to `~/.config/nvim_dev`.

## Variables

| Variable               | Description                                    | Default                 |
| ---------------------- | ---------------------------------------------- | ----------------------- |
| `nvim_dev_config_path` | Path to the Neovim dev config directory        | `~/Project/neovim/base` |
| `nvim_dev_appname`     | NVIM_APPNAME value (relative to `~/.config/`)  | `nvim_dev`              |
| `nvim_dev_alias`       | Name of the shell alias to create              | `nvim_dev`              |
| `nvim_dev_repo`        | URL of the Neovim config repository (optional) | `""` (empty)            |

## Dependencies

- `add_neovim_config` role
- Git (if using repository clone feature)
- Neovim installed on the system

## Example

To use this role in a playbook:

```yaml
- name: Setup Neovim dev configuration
  hosts: localhost
  roles:
    - nvim_dev
```

To customize the configuration:

```yaml
- name: Setup Neovim dev configuration with custom repo
  ansible.builtin.include_role:
    name: nvim_dev
  vars:
    nvim_dev_config_path: ~/my-custom-path
    nvim_dev_appname: my_nvim
    nvim_dev_alias: mynvim
    nvim_dev_repo: https://github.com/myuser/nvim-dev-config.git
```

This will:

- Store config at `~/my-custom-path`
- Create symlink at `~/.config/my_nvim` → `~/my-custom-path`
- Create alias: `alias mynvim="NVIM_APPNAME=my_nvim nvim"`
