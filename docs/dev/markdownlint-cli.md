# markdownlint-cli

## Overview

markdownlint-cli is a command-line interface for markdownlint, a linter for Markdown files. It helps maintain consistent formatting and catches common mistakes in Markdown documentation.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/markdownlint-cli`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/markdownlint-cli)

## Configuration

Configure via `.markdownlint.json` or `.markdownlintrc` in project root. Customize rules, enable/disable checks, and set formatting preferences.

## Usage

markdownlint-cli is used for linting Markdown files. Common commands:
- `markdownlint '**/*.md'` - Lint all Markdown files
- `markdownlint docs/` - Lint specific directory
- `markdownlint --fix '**/*.md'` - Auto-fix issues
- `markdownlint --config .markdownlintrc file.md` - Use specific config

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#markdownlint-cli`) |

## Dependencies

- Nix package manager
