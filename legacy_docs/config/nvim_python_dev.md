# Neovim Python Dev Configuration

## Overview

This role sets up a dedicated Neovim Python development configuration using the
`add_neovim_config` role. It is specifically configured for Python development
purposes with a separate configuration directory.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`./ansible/roles/config/nvim_python_dev`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/config/nvim_python_dev)

## Configuration

- **Config Path**: `~/Projects/neovim/python` (actual location)
- **NVIM_APPNAME**: `nvim_python_dev` (relative to `~/.config/`)
- **Alias**: `nvim_python_dev`
- **Repository**: Empty by default (can be configured)

## Usage

This role creates a separate Neovim configuration specifically for Python
development work. It uses the `add_neovim_config` role to:

1. Create the configuration directory at `~/Projects/neovim/python`
2. Create a symbolic link from `~/.config/nvim_python_dev` to `~/Projects/neovim/python`
3. Set up the alias `nvim_python_dev` to launch Neovim with this configuration

The created alias is:
`alias nvim_python_dev="NVIM_APPNAME=nvim_python_dev nvim"`

Note: `NVIM_APPNAME` is a relative path to `~/.config/`, so `nvim_python_dev` refers to `~/.config/nvim_python_dev`.

## Variables

| Variable                        | Description                                      | Default                     |
| ------------------------------- | ------------------------------------------------ | --------------------------- |
| `nvim_python_dev_config_path`   | Path to the Neovim Python dev config directory  | `~/Projects/neovim/python`  |
| `nvim_python_dev_appname`       | NVIM_APPNAME value (relative to `~/.config/`)   | `nvim_python_dev`           |
| `nvim_python_dev_alias`         | Name of the shell alias to create               | `nvim_python_dev`           |
| `nvim_python_dev_repo`          | URL of the Neovim config repository (optional)   | `""` (empty)                |

## Dependencies

- `add_neovim_config` role
- Git (if using repository clone feature)
- Neovim installed on the system

## Example

To use this role in a playbook:

```yaml
- name: Setup Neovim Python dev configuration
  hosts: localhost
  roles:
    - nvim_python_dev
```

To customize the configuration:

```yaml
- name: Setup Neovim Python dev configuration with custom repo
  ansible.builtin.include_role:
    name: nvim_python_dev
  vars:
    nvim_python_dev_config_path: ~/my-custom-python-path
    nvim_python_dev_appname: my_python_nvim
    nvim_python_dev_alias: pynvim
    nvim_python_dev_repo: https://github.com/myuser/nvim-python-config.git
```

This will:

- Store config at `~/my-custom-python-path`
- Create symlink at `~/.config/my_python_nvim` → `~/my-custom-python-path`
- Create alias: `alias pynvim="NVIM_APPNAME=my_python_nvim nvim"`
