# marksman

## Overview

marksman is a language server for Markdown that provides LSP features like go-to-definition for links, completions,
references, and diagnostics. Perfect for managing documentation in this project.

## Installation

- **Method**: Nix
- **Role Path**: [`/ansible/roles/dev/marksman`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/dev/marksman)

## Configuration

Configuration is done through your editor's LSP client. marksman automatically discovers Markdown files and builds a
workspace index.

## Usage

marksman runs automatically when editing Markdown files. Provides:

- Link completion and validation
- Go-to-definition for links
- Find references
- Document symbols
- Hover previews
- Diagnostics for broken links

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#marksman`) |

## Dependencies

- Nix package manager
- LSP client in your editor
