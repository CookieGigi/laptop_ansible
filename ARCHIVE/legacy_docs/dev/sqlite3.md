# sqlite3

## Overview

SQLite is a C-language library that implements a small, fast, self-contained,
high-reliability, full-featured, SQL database engine. SQLite is the most used
database engine in the world.

This role installs SQLite3, which includes:

- `sqlite3` - Command-line interface for SQLite databases
- SQLite3 library for application integration

SQLite3 is used by Snacks.picker for frecency and history features in Neovim.

## Installation

- **Method**: APT
- **Role Path**: `./ansible/roles/dev/sqlite3`
- **Package**: sqlite3

## Configuration

SQLite3 can be configured via:

- Command-line options
- SQL pragmas
- Runtime configuration files (typically `.sqliterc` in home directory)

## Usage

Common SQLite3 commands:

- `sqlite3 database.db` - Open or create a database
- `sqlite3 database.db "SELECT * FROM table;"` - Execute SQL query
- `.help` - Show available dot commands (inside sqlite3 shell)
- `.tables` - List all tables in database
- `.schema table_name` - Show table schema
- `.quit` - Exit sqlite3 shell

## Variables

No configurable variables for this role.

## Dependencies

- APT package manager
- System must have `sudo` privileges for package installation

## Notes

- SQLite3 databases are stored as single files, making them portable and easy
  to backup
- Required for Snacks.picker frecency and history tracking in Neovim
- SQLite is serverless - no separate database process is needed
- Perfect for embedded applications and local data storage
