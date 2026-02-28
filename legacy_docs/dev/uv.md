# uv

## Overview

uv is an extremely fast Python package and project manager written in Rust. It's designed as a drop-in replacement for pip, pip-tools, pipx, poetry, pyenv, and virtualenv, offering 10-100x faster performance while maintaining compatibility with existing Python packaging standards.

## Installation

- **Method**: Nix
- **Role Path**: `ansible/roles/package_manager/uv`

## Configuration

No configuration needed. uv works out of the box with standard Python projects. Configuration can be added via `pyproject.toml` if needed.

## Usage

Common uv commands:

- `uv pip install <package>` - Install packages (pip-compatible)
- `uv venv` - Create virtual environment
- `uv pip compile requirements.in` - Compile requirements (pip-tools compatible)
- `uv pip sync requirements.txt` - Sync environment to lockfile
- `uv run <command>` - Run command in project environment
- `uv tool install <package>` - Install CLI tools globally (pipx-compatible)

## Variables

| Variable | Description |
|----------|-------------|
| `nix_install_nix_packages` | List of Nix packages to install (`nixpkgs#uv`) |

## Dependencies

- Nix package manager

## Resources

- [Official documentation](https://docs.astral.sh/uv/)
- [GitHub repository](https://github.com/astral-sh/uv)
