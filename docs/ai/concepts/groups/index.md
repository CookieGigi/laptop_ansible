# Groups

Package collections defined in YAML with dependencies and conditions.

## Quick Reference

- **Structure**: See [structure.md](structure.md)
- **Create new group**: `./scripts/create-group.sh <name>`

## Package Managers (in order of preference)

1. **nix** - CLI tools and dev environments (preferred)
2. **flatpak** - GUI applications
3. **pipx** - Python CLI tools
4. **cargo** - Rust crates
5. **npm** - Node.js packages
6. **apt** - System packages (**use only when necessary**)

## Conditional Packages

Based on: NVIDIA GPU, laptop detection. See [conditions.md](../conditions.md).
