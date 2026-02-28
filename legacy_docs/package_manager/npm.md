# NPM

## Overview

This role installs Node Version Manager (NVM) and Node.js, and configures the shell to use NVM.

## Installation

- **Method**: Shell Script
- **Role Path**: [`/ansible/roles/package_manager/npm`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/package_manager/npm)

## Configuration

- **NVM Installation**: Installs NVM and the specified version of Node.js.
- **Shell Configuration**: Adds NVM configuration to the user's shell configuration file.

## Usage

This role is used to manage Node.js versions and npm packages.

## Variables

| Variable | Description |
|----------|-------------|
| `nvm_version` | Version of NVM to install (e.g., `0.39.7`) |
| `node_version` | Version of Node.js to install (e.g., `22.21.0`) |
| `shell_config` | Path to the shell configuration file (e.g., `~/.bashrc`) |

## Dependencies

- `curl`
- `git`
