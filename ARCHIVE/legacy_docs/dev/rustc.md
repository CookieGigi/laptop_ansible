# rustc

## Overview

rustc is the official Rust compiler. It compiles Rust source code into
executable binaries or libraries. While most developers use rustc through
cargo, it can be invoked directly for fine-grained control over compilation.

## Installation

- **Method**: rustup component
- **Role Path**: `./ansible/roles/dev/rustc`

## Configuration

Configure via command-line flags or through cargo configuration. Compiler
options can be set in `.cargo/config.toml`:

```toml
[build]
rustflags = ["-C", "target-cpu=native"]

[target.x86_64-unknown-linux-gnu]
rustflags = ["-C", "link-arg=-fuse-ld=lld"]
```

## Usage

Compile a single file:

```bash
rustc main.rs
```

Compile with optimizations:

```bash
rustc -O main.rs
```

Generate library:

```bash
rustc --crate-type=lib lib.rs
```

Most commonly used through cargo:

```bash
cargo build           # Debug build
cargo build --release # Release build with optimizations
```

## Common Options

- `-O`: Enable optimizations (equivalent to `-C opt-level=2`)
- `--release`: Build with optimizations and without debug info
- `--crate-type`: Specify output type (bin, lib, dylib, staticlib)
- `-C target-cpu=native`: Optimize for current CPU
- `--edition`: Specify Rust edition (2015, 2018, 2021)
- `-g`: Include debug information

## Variables

| Variable | Description |
|----------|-------------|
| `nix_profil_path` | Path to Nix profile for sourcing rustup |

## Dependencies

- Nix package manager
- rustup
- Rust toolchain (installed via cargo role)
