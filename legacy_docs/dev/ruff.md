# ruff

ruff is an extremely fast Python linter and code formatter, written in Rust. It can replace Flake8, Black, isort, pydocstyle, pyupgrade, autoflake, and more, with significantly better performance.

## Installation

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags ruff
```

## What it does

- Installs ruff via Nix
- Provides fast Python linting (10-100x faster than existing tools)
- Offers code formatting capabilities
- Supports 800+ lint rules from popular tools

## Package manager

Nix (nixpkgs)

## Tags

- `ruff`
- `python`
- `linter`
- `formatter`

## Dependencies

- Nix package manager (installed via nix_install role)

## Usage

```bash
# Lint Python files
ruff check .

# Format Python files
ruff format .

# Auto-fix issues
ruff check --fix .
```

## Related tools

- basedpyright: Python LSP server
- mypy: Static type checker
- debugpy: Python debug adapter
