# Add Source to Config

## Overview

This role adds a source command to the user's shell configuration file to include another file.

## Installation

- **Method**: Shell Configuration
- **Role Path**: [`/ansible/roles/terminal/add_source_to_config`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/terminal/add_source_to_config)

## Configuration

- **Source Command**: Adds a source command to the shell configuration file.

## Usage

This role is used to include additional configuration files in the user's shell environment.

## Variables

| Variable | Description |
|----------|-------------|
| `shell_config` | Path to the shell configuration file (e.g., `~/.bashrc`) |
| `path` | Path to the file to be sourced (e.g., `~/.profile`) |

## Dependencies

- Shell configuration file
