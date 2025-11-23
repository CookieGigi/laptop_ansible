# debugpy

debugpy is an implementation of the Debug Adapter Protocol (DAP) for Python. It enables debugging Python code in various editors and IDEs that support DAP, including VS Code, Neovim, and others.

## Installation

```bash
cd ansible && ansible-playbook playbooks/dev.yml --tags debugpy
```

## What it does

- Installs debugpy via Nix (Python 3.12 version)
- Provides debugging capabilities for Python applications
- Supports breakpoints, stepping, variable inspection, and more
- Works with any editor/IDE that supports Debug Adapter Protocol

## Package manager

Nix (nixpkgs)

## Tags

- `debugpy`
- `python`
- `debugger`

## Dependencies

- Nix package manager (installed via nix_install role)
- Python 3.12

## Usage

### Command Line
```bash
# Debug a Python script
python -m debugpy --listen 5678 --wait-for-client script.py
```

### In Code
```python
import debugpy

# Start debug server
debugpy.listen(5678)
print("Waiting for debugger attach...")
debugpy.wait_for_client()

# Your code here
```

## Related tools

- basedpyright: Python LSP server
- ruff: Fast Python linter and formatter
- mypy: Static type checker
- codelldb: LLDB-based debugger for Rust
