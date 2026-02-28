# lua

## Overview

Lua is a powerful, efficient, lightweight, embeddable scripting language. It supports procedural programming,
object-oriented programming, functional programming, data-driven programming, and data description.

This role installs Lua 5.1, which includes:

- `lua5.1` - The Lua interpreter
- `luac5.1` - The Lua bytecode compiler

## Installation

- **Method**: APT
- **Role Path**: `./ansible/roles/dev/lua`
- **Package**: lua5.1

## Configuration

Lua can be configured via environment variables and runtime configuration. Configuration files are typically
placed in `/etc/lua5.1/` or `~/.luarc`.

## Usage

Common Lua commands:

- `lua5.1 script.lua` - Run a Lua script
- `lua5.1` - Start interactive Lua REPL
- `luac5.1 -o output.luac script.lua` - Compile Lua script to bytecode
- `luac5.1 -l script.lua` - List compiled bytecode

## Variables

No configurable variables for this role.

## Dependencies

- APT package manager
- System must have `sudo` privileges for package installation

## Notes

- Lua 5.1 was chosen for compatibility with many existing tools and libraries
- The executables are versioned (`lua5.1`, `luac5.1`) to allow multiple Lua versions
- To use unversioned commands (`lua`, `luac`), you may need to install `lua-any` or create symlinks
