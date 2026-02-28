# codelldb

## Overview

CodeLLDB is a native debugger extension powered by LLDB. It provides debugging
support for Rust, C, C++, and other compiled languages with full breakpoint
support, variable inspection, and expression evaluation.

## Installation

- **Method**: Nix
- **Role Path**: `./ansible/roles/dev/codelldb`

## Configuration

Configure through your editor's debugger adapter protocol (DAP) client. For
Neovim, use nvim-dap:

```lua
local dap = require('dap')
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = 'codelldb',
    args = {"--port", "${port}"},
  }
}
```

## Usage

Set breakpoints in your code and start debugging sessions. Features include:

- Breakpoint management (conditional, hit count)
- Step through code (step in, over, out)
- Variable inspection and watch expressions
- Call stack navigation
- Memory inspection
- Expression evaluation in debug context
- Multi-threaded debugging

## Common Commands

When debugging Rust projects:

```bash
# Build with debug symbols
cargo build

# Run with debugger attached
# (typically done through editor integration)
```

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | VSCode LLDB extension package from Nix |

## Dependencies

- Nix package manager
- DAP client in your editor
- LLDB debugger
- Debug symbols in compiled binaries
