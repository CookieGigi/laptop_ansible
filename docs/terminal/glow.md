# glow

## Overview

glow is a terminal-based markdown renderer that displays markdown files with
beautiful formatting and syntax highlighting. It supports different themes,
paging, and can render markdown from files, URLs, or stdin. Perfect for viewing
documentation and README files directly in the terminal.

## Installation

- **Method**: Nix
- **Role Path**: `ansible/roles/terminal/glow`

## Configuration

glow can be configured through `~/.config/glow/glow.yml`. You can customize
themes, default styles, and paging behavior.

## Usage

glow is used for rendering markdown files in the terminal. Common commands:

- `glow README.md` - Render a markdown file
- `glow -p` - Enable paging for long documents
- `glow -s dark` - Use dark theme
- `glow https://example.com/README.md` - Render markdown from URL
- `echo "# Hello" | glow -` - Render from stdin

## Variables

| Variable | Description |
|----------|-------------|
| `nix_install_nix_packages` | List of Nix packages to install (`nixpkgs#glow`) |

## Dependencies

- Nix package manager
