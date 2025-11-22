# rustfmt

## Overview

rustfmt is the official Rust code formatter. It automatically formats Rust code
according to style guidelines, ensuring consistent formatting across projects
and teams.

## Installation

- **Method**: rustup component
- **Role Path**: `./ansible/roles/dev/rustfmt`

## Configuration

Configure via `rustfmt.toml` or `.rustfmt.toml` in your project root:

```toml
max_width = 100
hard_tabs = false
tab_spaces = 4
edition = "2021"
```

## Usage

Format a single file:

```bash
rustfmt src/main.rs
```

Format entire project:

```bash
cargo fmt
```

Check formatting without modifying files:

```bash
cargo fmt -- --check
```

Format with custom config:

```bash
rustfmt --config max_width=120 src/main.rs
```

## Common Configuration Options

- `max_width`: Maximum line width (default: 100)
- `tab_spaces`: Number of spaces per tab (default: 4)
- `edition`: Rust edition (2015, 2018, 2021)
- `use_small_heuristics`: Control formatting heuristics
- `imports_granularity`: How to group imports

## Variables

| Variable | Description |
|----------|-------------|
| `nix_profil_path` | Path to Nix profile for sourcing rustup |

## Dependencies

- Nix package manager
- rustup
- Rust toolchain
