# clippy

## Overview

Clippy is a collection of lints to catch common mistakes and improve Rust code.
It provides hundreds of lints that check for correctness, performance, style,
and complexity issues in Rust projects.

## Installation

- **Method**: rustup component
- **Role Path**: `./ansible/roles/dev/clippy`

## Configuration

Configure via `clippy.toml` or in `Cargo.toml`:

```toml
[lints.clippy]
too_many_arguments = "allow"
```

## Usage

Run clippy on your project:

```bash
cargo clippy
```

Check with warnings as errors:

```bash
cargo clippy -- -D warnings
```

Automatically fix some issues:

```bash
cargo clippy --fix
```

## Common Lints

- **Correctness**: Catches bugs and incorrect code
- **Performance**: Suggests more efficient alternatives
- **Style**: Enforces Rust idioms and best practices
- **Complexity**: Warns about overly complex code
- **Pedantic**: Extra-strict lints (opt-in)

## Variables

| Variable | Description |
|----------|-------------|
| `nix_profil_path` | Path to Nix profile for sourcing rustup |

## Dependencies

- Nix package manager
- rustup
- Rust toolchain
