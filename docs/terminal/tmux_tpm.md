# Tmux TPM (Tmux Plugin Manager)

## Overview

TPM (Tmux Plugin Manager) is a plugin manager for tmux that allows you to easily install, update, and manage tmux plugins. It simplifies the process of extending tmux functionality through plugins.

## Installation

- **Method**: Git clone
- **Role Path**: `ansible/roles/terminal/tmux_tpm`
- **Install Location**: `~/.tmux/plugins/tpm`

## Configuration

The role automatically:

- Creates the `~/.tmux/plugins` directory
- Clones the TPM repository from GitHub
- Initializes TPM in your `.tmux.conf`

## Default Plugins

The following plugins are pre-configured in `.tmux.conf`:

1. **tmux-plugins/tpm** - The plugin manager itself
2. **tmux-plugins/tmux-sensible** - Basic tmux settings everyone can agree on
3. **tmux-plugins/tmux-resurrect** - Restore tmux environment after system restart
4. **tmux-plugins/tmux-continuum** - Continuous saving of tmux environment

## Usage

### Installing Plugins

After starting tmux, install all configured plugins:

```bash
# Press prefix + I (capital i) to fetch and install plugins
# Default prefix is Ctrl+b
```

### Updating Plugins

```bash
# Press prefix + U (capital u) to update plugins
```

### Removing Plugins

1. Remove or comment out the plugin line from `.tmux.conf`
2. Press `prefix + alt + u` to remove the plugin

### Adding New Plugins

Edit your `.tmux.conf` and add new plugin lines:

```bash
set -g @plugin 'plugin-author/plugin-name'
```

Then press `prefix + I` to install the new plugin.

## Variables

| Variable           | Default                                    | Description               |
| ------------------ | ------------------------------------------ | ------------------------- |
| `tpm_install_path` | `{{ ansible_env.HOME }}/.tmux/plugins/tpm` | Installation path for TPM |
| `tpm_repo_url`     | `https://github.com/tmux-plugins/tpm`      | TPM repository URL        |

## Dependencies

- tmux (installed via the `tmux` role)
- git (for cloning repositories)

## Included In

This role is automatically included when the `tmux` role is applied.

## Additional Resources

- [TPM GitHub Repository](https://github.com/tmux-plugins/tpm)
- [Tmux Plugins List](https://github.com/tmux-plugins)
