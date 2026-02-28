# Neovim Production Configuration

## Overview

This role sets up your production Neovim configuration for daily use. It uses the
`add_neovim_config` role to manage configuration files and creates a convenient
`vi` alias for launching Neovim.

## Installation

- **Method**: Ansible Role
- **Role Path**: [`./ansible/roles/config/nvim_prod`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/config/nvim_prod)

## Configuration

- **Config Path**: `~/.config/nvim` (default Neovim location)
- **NVIM_APPNAME**: Empty (uses default `nvim`)
- **Alias**: `vi`
- **Repository**: `https://github.com/CookieGigi/neovim_config_base.git`

## Usage

This role creates your production Neovim setup by:

1. Cloning your Neovim configuration from the Git repository to `~/.config/nvim`
2. Creating a `vi` alias that launches Neovim
3. Keeping your config in sync with the repository

The created alias is:
`alias vi="nvim"`

## Repository Structure

Your Neovim configuration repository should have config files at the root level:

```text
neovim_config_base/
├── init.lua
├── lua/
│   └── ...
├── lazy-lock.json
└── README.md
```

This structure matches the standard Neovim configuration layout.

## Variables

| Variable | Description | Default |
| -------- | ----------- | ------- |
| `nvim_prod_config_path` | Path to Neovim config directory | `~/.config/nvim` |
| `nvim_prod_appname` | NVIM_APPNAME value | `""` (empty) |
| `nvim_prod_alias` | Shell alias for Neovim | `vi` |
| `nvim_prod_repo` | Neovim config repository URL | `https://github.com/CookieGigi/neovim_config_base.git` |

## Dependencies

- `add_neovim_config` role
- Git
- Neovim installed on the system

## Comparison: nvim_dev vs nvim_prod

| Feature | nvim_dev (Dev) | nvim_prod (Prod) |
| ------- | -------------- | ---------------- |
| **Config Location** | `~/Project/neovim/base` | `~/.config/nvim` |
| **NVIM_APPNAME** | `nvim_dev` | `""` (default) |
| **Alias** | `nvim_dev` | `vi` |
| **Repository** | Same repo | Same repo |
| **Use Case** | Development/testing | Daily production |

## Example

To use this role in a playbook:

```yaml
- name: Setup Neovim production configuration
  hosts: localhost
  roles:
    - nvim_prod
```

To customize the configuration:

```yaml
- name: Setup Neovim production with custom settings
  ansible.builtin.include_role:
    name: nvim_prod
  vars:
    nvim_prod_alias: vim
    nvim_prod_config_path: ~/.config/nvim-prod
```

This will:

- Clone config to `~/.config/nvim-prod`
- Create alias: `alias vim="nvim"`

## Notes

- The production config uses the default Neovim location (`~/.config/nvim`)
- Both dev and prod roles use the same repository but deploy to different
  locations
- The `vi` alias provides a convenient shortcut for daily use
- For development work, use the `nvim_dev` role to keep configurations
  separate
