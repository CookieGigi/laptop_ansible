# luarocks

## Overview

LuaRocks is the package manager for Lua modules. It allows you to install, manage, and distribute Lua libraries and
applications. Similar to npm for Node.js or pip for Python, LuaRocks makes it easy to share and reuse code in the Lua
ecosystem.

## Installation

- **Method**: Nix
- **Role Path**: `ansible/roles/dev/luarocks`

## Configuration

LuaRocks configuration is stored in:

- System-wide: `/etc/luarocks/config.lua`
- User-specific: `~/.luarocks/config.lua`

Configuration includes settings for package installation paths, repositories, and build dependencies.

## Usage

LuaRocks is used for managing Lua packages. Common commands:

- `luarocks install <package>` - Install a package
- `luarocks install --local <package>` - Install package locally (user directory)
- `luarocks list` - List installed packages
- `luarocks search <query>` - Search for packages
- `luarocks remove <package>` - Remove a package
- `luarocks show <package>` - Show package information
- `luarocks make` - Build and install from a rockspec file

### Local vs System Installation

- `--local` flag installs to `~/.luarocks/` (recommended for user-specific packages)
- Without `--local`, packages install system-wide (requires elevated permissions)

## Variables

| Variable       | Description                                          |
| -------------- | ---------------------------------------------------- |
| `nix_packages` | List of Nix packages to install (`nixpkgs#luarocks`) |

## Dependencies

- Nix package manager
- Lua interpreter (lua5.1, lua5.2, lua5.3, lua5.4, or luajit)
- C compiler (for packages with native extensions)

## Integration

LuaRocks integrates well with:

- **Neovim**: Install Lua plugins and dependencies
- **Lua LSP**: Provides package resolution for lua-language-server
- **Development**: Manage project dependencies via rockspec files
