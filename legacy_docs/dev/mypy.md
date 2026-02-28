# mypy

mypy is a static type checker for Python. It combines the benefits of dynamic typing and static typing by allowing you to add type hints to Python code and checking them for type errors.

## Installation

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags mypy
```

## What it does

- Installs mypy via Nix
- Provides static type checking for Python code
- Catches type-related bugs before runtime
- Supports gradual typing (works with partially typed code)

## Package manager

Nix (nixpkgs)

## Tags

- `mypy`
- `python`
- `type-checker`

## Dependencies

- Nix package manager (installed via nix_install role)

## Usage

```bash
# Check a single file
mypy script.py

# Check entire project
mypy .

# Check with strict mode
mypy --strict .
```

## Related tools

- basedpyright: Python LSP server with type checking
- ruff: Fast Python linter and formatter
- debugpy: Python debug adapter
