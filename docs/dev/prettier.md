# prettier

## Overview

Prettier is an opinionated code formatter that supports many languages including JavaScript, TypeScript, CSS, HTML,
JSON, Markdown, and YAML. It enforces a consistent code style by parsing code and re-printing it with its own rules.

## Installation

- **Method**: npm (global)
- **Role Path**: `ansible/roles/dev/prettier`

## Configuration

Configure via `.prettierrc`, `.prettierrc.json`, `.prettierrc.yml`, or `prettier.config.js` in your project root.

## Usage

Prettier provides commands for formatting code:

- `prettier --write .` - Format all supported files
- `prettier --check .` - Check if files are formatted
- `prettier --write file.js` - Format specific file
- `prettier --write "**/*.{js,json,md}"` - Format specific file types

## Variables

| Variable              | Description                         |
| --------------------- | ----------------------------------- |
| `npm_install_package` | npm package to install (`prettier`) |

## Dependencies

- npm package manager
