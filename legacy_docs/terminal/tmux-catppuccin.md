# Tmux Catppuccin Theme

## Overview

Catppuccin is a soothing pastel theme for tmux with four beautiful flavors: Latte, Frappé, Macchiato, and Mocha.
This role installs the Catppuccin theme using the official manual installation method.

## Installation

- **Method**: Git clone (manual installation)
- **Role Path**: `ansible/roles/terminal/tmux_catppuccin`
- **Install Location**: `~/.config/tmux/plugins/catppuccin/tmux`

## Configuration

The role automatically:

- Creates the `~/.config/tmux/plugins/catppuccin` directory
- Clones the Catppuccin repository from GitHub (tagged version v2.1.3)
- Configures the theme in `.tmux.conf`

## Flavors

Choose from four beautiful color schemes:

1. **Latte** - Light theme with warm tones
2. **Frappé** - Cool dark theme
3. **Macchiato** - Warm dark theme (default)
4. **Mocha** - Deep dark theme

## Window Status Styles

- **basic** - Simple rectangular windows
- **rounded** - Rounded corners
- **slanted** - Slanted edges (default)
- **custom** - Define your own

## Variables

| Variable                              | Default                                  | Description             |
| ------------------------------------- | ---------------------------------------- | ----------------------- |
| `tmux_catppuccin_install_path`        | `~/.config/tmux/plugins/catppuccin/tmux` | Installation directory  |
| `tmux_catppuccin_repo_url`            | `https://github.com/catppuccin/tmux.git` | Repository URL          |
| `tmux_catppuccin_version`             | `v2.1.3`                                 | Version tag to install  |
| `tmux_catppuccin_flavor`              | `macchiato`                              | Color scheme flavor     |
| `tmux_catppuccin_window_status_style` | `slanted`                                | Window status bar style |

## Usage

### Applying the Theme

After installation, reload your tmux configuration:

```bash
tmux source ~/.tmux.conf
```

Or restart tmux completely.

### Changing Flavors

Edit your variables in the playbook or `group_vars/all.yml`:

```yaml
tmux_catppuccin_flavor: "mocha" # latte, frappe, macchiato, or mocha
```

### Changing Window Status Style

Edit the window status style variable:

```yaml
tmux_catppuccin_window_status_style: "rounded" # basic, rounded, slanted, or custom
```

## Dependencies

- tmux (installed via the `tmux` role)
- git (for cloning repository)
- tmux_tpm (Tmux Plugin Manager)

## Included In

This role is automatically included when the `tmux` role is applied via the basic playbook.

## Additional Resources

- [Catppuccin tmux GitHub](https://github.com/catppuccin/tmux)
- [Catppuccin Color Palette](https://github.com/catppuccin/catppuccin)
- [Configuration Reference](https://github.com/catppuccin/tmux/blob/main/docs/reference/configuration.md)
- [Getting Started Guide](https://github.com/catppuccin/tmux/blob/main/docs/tutorials/01-getting-started.md)

## Notes

- Nerd Fonts are recommended for proper icon display
- The manual installation method is preferred over TPM to avoid name conflicts
- Status modules can be customized extensively (see official documentation)
- The theme loads before TPM plugins in `.tmux.conf` for proper initialization
