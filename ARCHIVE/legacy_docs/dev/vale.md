# Vale

## Overview

Vale is a syntax-aware linter for prose built with speed and extensibility in mind. It's designed to enforce custom
editorial styles and works with Markdown, HTML, reStructuredText, AsciiDoc, and more.

## Installation

- **Method**: Nix
- **Role Path**: `ansible/roles/dev/vale`

## Configuration

Vale uses a `.vale.ini` configuration file in your project root. You can also create custom styles in a `styles/`
directory.

Example `.vale.ini`:

```ini
StylesPath = styles
MinAlertLevel = suggestion

[*.md]
BasedOnStyles = Vale
```

## Usage

Common commands:

- `vale file.md` - Lint a single file
- `vale docs/` - Lint all files in directory
- `vale --glob='*.md' .` - Lint all Markdown files
- `vale --config=.vale.ini file.md` - Use specific config
- `vale sync` - Download style packages

## Variables

| Variable | Description |
|----------|-------------|
| `nix_install_nix_packages` | List of Nix packages to install (`nixpkgs#vale`) |

## Dependencies

- Nix package manager
