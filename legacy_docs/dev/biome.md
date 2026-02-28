# biome

## Overview

Biome is a fast formatter and linter for JavaScript, TypeScript, JSX, JSON, and CSS. It's designed as a performant
alternative to tools like ESLint and Prettier, with a focus on speed and developer experience.

## Installation

- **Method**: Nix
- **Role Path**: `ansible/roles/dev/biome`

## Configuration

Configure via `biome.json` or `biome.jsonc` in your project root. Biome supports configuration for both formatting and
linting rules.

## Usage

Biome provides commands for formatting and linting code:

- `biome format --write .` - Format all supported files
- `biome check .` - Run linter on all files
- `biome check --apply .` - Run linter and apply safe fixes
- `biome format file.ts` - Format specific file
- `biome lint file.js` - Lint specific file

## Variables

| Variable       | Description                                       |
| -------------- | ------------------------------------------------- |
| `nix_packages` | List of Nix packages to install (`nixpkgs#biome`) |

## Dependencies

- Nix package manager
