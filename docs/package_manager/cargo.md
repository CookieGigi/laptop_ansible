# Cargo

## Overview

Cargo is the Rust package manager and build tool. It downloads your Rust
project's dependencies, compiles your packages, makes distributable packages,
and uploads them to crates.io (the Rust community's package registry).

This role installs rustup via Nix and configures it to use the Rust nightly
toolchain, which includes:

- `rustup` - The Rust toolchain installer and version manager
- `cargo` - The Rust package manager and build tool
- `rustc` - The Rust compiler (nightly version)
- Rust standard library and toolchain components

## Installation

- **Method**: Nix (rustup) + rustup toolchain installation
- **Role Path**: `./ansible/roles/package_manager/cargo`
- **Package**: nixpkgs#rustup
- **Toolchain**: Rust nightly (set as default)

## Configuration

Cargo can be configured via:

- `~/.cargo/config.toml` - User-level configuration
- `Cargo.toml` - Project-level manifest file
- Environment variables (e.g., `CARGO_HOME`, `RUSTFLAGS`)

## Usage

Common Cargo commands:

- `cargo new project_name` - Create a new Rust project
- `cargo build` - Build the project
- `cargo build --release` - Build with optimizations
- `cargo run` - Build and run the project
- `cargo test` - Run tests
- `cargo check` - Check code without building
- `cargo doc` - Build documentation
- `cargo clean` - Remove build artifacts
- `cargo install <crate>` - Install a binary crate
- `cargo update` - Update dependencies

Common rustup commands:

- `rustup update` - Update all installed toolchains
- `rustup toolchain list` - List installed toolchains
- `rustup default <toolchain>` - Set default toolchain
- `rustup show` - Show active toolchain and installed targets
- `rustc --version` - Show Rust compiler version

## Variables

| Variable                   | Description                                      |
| -------------------------- | ------------------------------------------------ |
| `nix_install_nix_packages` | List of Nix packages to install (`nixpkgs#rustup`)|

## Dependencies

- Nix package manager

## Notes

- This role installs rustup via Nix for reproducibility
- The nightly toolchain is automatically installed and set as default
- Rustup manages Rust versions and allows easy switching between toolchains
- Use `rustup update nightly` to update to the latest nightly version
- Cargo stores crates in `~/.cargo` by default
- Nightly provides access to unstable Rust features and latest improvements
