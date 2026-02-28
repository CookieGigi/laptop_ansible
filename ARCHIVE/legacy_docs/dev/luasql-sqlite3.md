# luasql-sqlite3

## Overview

LuaSQL-SQLite3 is a Lua binding for SQLite3, allowing you to interact with
SQLite databases directly from Lua code. It provides a simple and efficient
interface for database operations including queries, transactions, and data
manipulation. This binding is part of the LuaSQL family of database
connectivity libraries.

## Installation

- **Method**: LuaRocks (with Nix dependencies)
- **Role Path**: `ansible/roles/dev/luasql-sqlite3`

This role automates the multi-step installation process:

1. Installs SQLite3 development files via `sqlite-dev` role
2. Installs LuaRocks package manager via `luarocks` role
3. Discovers SQLite3 include and library paths dynamically
4. Compiles and installs luasql-sqlite3 using LuaRocks with proper paths

## Configuration

LuaSQL-SQLite3 is installed locally (user-space) via LuaRocks. The binding
is automatically available to Lua scripts once installed.

### Installation Paths

- Installed to: `~/.luarocks/`
- Requires: SQLite3 headers in `~/.nix-profile/include/sqlite3.h`
- Links against: `/nix/store/xxx-sqlite-VERSION/lib/libsqlite3.so`

## Usage

LuaSQL-SQLite3 is used for database operations in Lua scripts. Common usage
patterns:

```lua
local luasql = require "luasql.sqlite3"

-- Create environment
local env = luasql.sqlite3()

-- Open database connection
local conn = env:connect("mydb.sqlite")

-- Execute queries
local cursor = conn:execute("SELECT * FROM users")

-- Fetch results
local row = cursor:fetch({}, "a")
while row do
  print(row.id, row.name)
  row = cursor:fetch(row, "a")
end

-- Close connection
cursor:close()
conn:close()
env:close()
```

### Basic Operations

- **Create table**:
  `conn:execute("CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT)")`
- **Insert data**: `conn:execute("INSERT INTO users VALUES (1, 'John')")`
- **Query data**: `cursor = conn:execute("SELECT * FROM users WHERE id = 1")`
- **Update data**: `conn:execute("UPDATE users SET name = 'Jane' WHERE id = 1")`
- **Delete data**: `conn:execute("DELETE FROM users WHERE id = 1")`

### Transaction Support

```lua
conn:execute("BEGIN TRANSACTION")
conn:execute("INSERT INTO users VALUES (2, 'Alice')")
conn:execute("INSERT INTO users VALUES (3, 'Bob')")
conn:execute("COMMIT")
```

## Variables

This role uses internal path discovery and does not require user-defined
variables. The following are automatically discovered:

| Variable            | Description                               |
| ------------------- | ----------------------------------------- |
| `sqlite_include_dir`| Auto-discovered SQLite3 header path       |
| `sqlite_lib_dir`    | Auto-discovered SQLite3 library path      |

## Dependencies

Required roles (automatically included):

- `sqlite-dev`: SQLite3 development files
- `luarocks`: Lua package manager

Additional dependencies:

- Nix package manager
- Lua interpreter (lua5.1 or luajit recommended)
- SQLite3 runtime library

## Integration

LuaSQL-SQLite3 integrates well with:

- **Neovim**: Use SQLite databases for plugin data persistence
- **Lua scripts**: Embed database functionality in automation scripts
- **Data processing**: Store and query structured data in Lua applications
- **Configuration management**: Use SQLite as a configuration backend

## Troubleshooting

### Installation Fails

If installation fails, verify that:

- `sqlite-dev` is installed: `find ~/.nix-profile -name "sqlite3.h"`
- LuaRocks is available: `which luarocks`
- Nix profile is sourced: `source ~/.nix-profile/etc/profile.d/nix.sh`

### Cannot Find Library

If Lua cannot find the module:

```lua
-- Add to Lua path if needed
package.cpath = package.cpath .. ";/home/username/.luarocks/lib/lua/5.1/?.so"
```

## Related Roles

- `lua`: Provides the Lua interpreter
- `sqlite3`: Provides the SQLite3 database engine
- `sqlite-dev`: Provides SQLite3 development files (required)
- `luarocks`: Package manager for Lua modules (required)
