# sqlite-dev

## Overview

SQLite development files provide the headers and libraries needed to compile
programs that link against SQLite. This includes the `sqlite3.h` header file
and the SQLite shared library, which are required for building native
extensions and bindings like LuaSQL-SQLite3.

## Installation

- **Method**: Nix
- **Role Path**: `ansible/roles/dev/sqlite-dev`

## Configuration

No configuration is required. The development files are installed to the Nix
profile and are automatically available to build tools.

## Usage

The SQLite development files are used during compilation of programs that
interact with SQLite databases. They are typically not used directly by end
users, but are dependencies for other development tools.

### Common Use Cases

- **Building Lua bindings**: Required for luasql-sqlite3
- **Compiling C/C++ programs**: Programs that use SQLite database
- **Building Python extensions**: Native SQLite adapters
- **Creating language bindings**: For various programming languages

### File Locations

After installation via Nix, files are typically found at:

- Header files: `~/.nix-profile/include/sqlite3.h`
- Library files: `/nix/store/xxx-sqlite-VERSION/lib/libsqlite3.so`

## Variables

| Variable                   | Description                           |
| -------------------------- | ------------------------------------- |
| `nix_install_nix_packages` | List of Nix packages (sqlite.dev)     |

## Dependencies

- Nix package manager
- SQLite3 runtime (usually bundled with dev package)

## Integration

SQLite development files are required by:

- **luasql-sqlite3**: Lua bindings for SQLite
- **Python sqlite3**: Native SQLite adapter for Python
- **Node.js sqlite3**: Native bindings for Node.js
- **Various language bindings**: Any language requiring native SQLite access

## Related Roles

- `sqlite3`: Provides the SQLite3 database command-line tool
- `luasql-sqlite3`: Lua bindings that depend on these development files
- `luarocks`: Package manager used to build Lua native extensions
