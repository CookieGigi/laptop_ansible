# Neovim Rust Dev Configuration

## Overview

This role sets up a dedicated Neovim Rust development configuration using the
`add_neovim_config` role. It is specifically configured for Rust development
purposes with a separate configuration directory.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`./ansible/roles/config/nvim_rust_dev`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/config/nvim_rust_dev)

## Configuration

- **Config Path**: `~/Project/neovim/rust` (actual location)
- **NVIM_APPNAME**: `nvim_rust_dev` (relative to `~/.config/`)
- **Alias**: `nvim_rust_dev`
- **Repository**: Empty by default (can be configured)

## Usage

This role creates a separate Neovim configuration specifically for Rust
development work. It uses the `add_neovim_config` role to:

1. Create the configuration directory at `~/Project/neovim/rust`
2. Create a symbolic link from `~/.config/nvim_rust_dev` to `~/Project/neovim/rust`
3. Set up the alias `nvim_rust_dev` to launch Neovim with this configuration

The created alias is:
`alias nvim_rust_dev="NVIM_APPNAME=nvim_rust_dev nvim"`

Note: `NVIM_APPNAME` is a relative path to `~/.config/`, so `nvim_rust_dev` refers to `~/.config/nvim_rust_dev`.

## Variables

| Variable                      | Description                                    | Default                   |
| ----------------------------- | ---------------------------------------------- | ------------------------- |
| `nvim_rust_dev_config_path`   | Path to the Neovim Rust dev config directory  | `~/Project/neovim/rust`   |
| `nvim_rust_dev_appname`       | NVIM_APPNAME value (relative to `~/.config/`) | `nvim_rust_dev`           |
| `nvim_rust_dev_alias`         | Name of the shell alias to create             | `nvim_rust_dev`           |
| `nvim_rust_dev_repo`          | URL of the Neovim config repository (optional) | `""` (empty)              |

## Dependencies

- `add_neovim_config` role
- Git (if using repository clone feature)
- Neovim installed on the system

## Example

To use this role in a playbook:

```yaml
- name: Setup Neovim Rust dev configuration
  hosts: localhost
  roles:
    - nvim_rust_dev
```

To customize the configuration:

```yaml
- name: Setup Neovim Rust dev configuration with custom repo
  ansible.builtin.include_role:
    name: nvim_rust_dev
  vars:
    nvim_rust_dev_config_path: ~/my-custom-rust-path
    nvim_rust_dev_appname: my_rust_nvim
    nvim_rust_dev_alias: rustnvim
    nvim_rust_dev_repo: https://github.com/myuser/nvim-rust-config.git
```

This will:

- Store config at `~/my-custom-rust-path`
- Create symlink at `~/.config/my_rust_nvim` → `~/my-custom-rust-path`
- Create alias: `alias rustnvim="NVIM_APPNAME=my_rust_nvim nvim"`
