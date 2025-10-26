# Add Alias

## Overview

This role adds an alias to the user's shell configuration file.

## Installation

- **Method**: Shell Configuration
- **Role Path**: [`/ansible/roles/terminal/add_alias`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/terminal/add_alias)

## Configuration

- **Alias**: Adds a specified alias to the shell configuration file.

## Usage

This role is used to create shortcuts for frequently used commands.

## Variables

| Variable | Description |
|----------|-------------|
| `shell_config` | Path to the shell configuration file (e.g., `~/.bashrc`) |
| `alias_name` | Name of the alias (e.g., `ll`) |
| `alias_cmd` | Command for the alias (e.g., `ls -alF`) |

## Dependencies

- Shell configuration file