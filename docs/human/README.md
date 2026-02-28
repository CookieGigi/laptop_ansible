# Documentation

This is a userspace package management system using Ansible.

## For Users

- [Quick Start](QUICKSTART.md) - Get running in 5 minutes
- [Command Reference](COMMANDS.md) - All available commands
- [Troubleshooting](TROUBLESHOOTING.md) - Common issues and solutions
- [Contributing](CONTRIBUTING.md) - How to contribute

## For Developers

- [Changelog](../CHANGELOG.md) - Project changes and migration phases

## For AI Assistants

- [Migration Plan](ai/MIGRATION_PLAN.md) - Full migration details

## What is This?

A system to install and manage software packages across multiple package managers (Nix, Flatpak, Cargo, npm, pipx, APT) using group-based organization.

Groups define collections of packages. Presets are pre-configured group collections.

State is tracked in `ansible/inventory/state.yml`.
