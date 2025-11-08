# prettier

## Overview

prettier is an opinionated code formatter supporting multiple languages including YAML, Markdown, JSON, JavaScript, and more. Ensures consistent formatting across all your configuration and documentation files.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/prettier`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/prettier)

## Configuration

Configure via `.prettierrc`, `.prettierrc.json`, or `prettier.config.js`. Set formatting preferences like line width, indentation, and language-specific options.

## Usage

prettier is used for formatting code and configuration files. Common commands:
- `prettier --write '**/*.md'` - Format all Markdown files
- `prettier --write '**/*.yml'` - Format all YAML files
- `prettier --check .` - Check formatting without changing files
- `prettier --write file.json` - Format specific file

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#nodePackages.prettier`) |

## Dependencies

- Nix package manager
