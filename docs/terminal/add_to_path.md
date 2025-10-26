# Add to Path

## Overview

This role adds a directory to the user's PATH environment variable.

## Installation

- **Method**: Shell Configuration
- **Role Path**: [`/ansible/roles/terminal/add_to_path`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/terminal/add_to_path)

## Configuration

- **PATH Addition**: Adds a specified directory to the PATH in the shell configuration file.

## Usage

This role is used to make executables in a directory accessible from anywhere in the shell.

## Variables

| Variable | Description |
|----------|-------------|
| `shell_config` | Path to the shell configuration file (e.g., `~/.bashrc`) |
| `path_directory` | Directory to add to PATH (e.g., `~/bin`) |

## Dependencies

- Shell configuration file