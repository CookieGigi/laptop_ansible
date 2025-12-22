# Inkscape

Professional vector graphics editor for creating and editing SVG files.

## Installation

```bash
cd ansible && ansible-playbook playbooks/app.yml --tags inkscape
```

## What It Installs

- **Package**: `org.inkscape.Inkscape` (Flatpak, user-space)
- **Alias**: `inkscape`

## Features

- SVG-based vector graphics creation and editing
- Professional-grade drawing tools (pen, bezier, calligraphy)
- Object manipulation (transformations, boolean operations)
- Text support with full typography control
- Path editing and node manipulation
- Export to various formats (PNG, PDF, EPS, PostScript)
- Extensions and scripting support

## Usage

Launch Inkscape:

```bash
inkscape
# or
flatpak run org.inkscape.Inkscape
```

## Package Manager

Installed via **Flatpak** in user space (`--user` flag).

## References

- [Official Website](https://inkscape.org/)
- [Documentation](https://inkscape.org/learn/)
- [Flathub Page](https://flathub.org/apps/org.inkscape.Inkscape)
