# wasm32-wasip1

## Overview

The wasm32-wasip1 target is a Rust compilation target for WebAssembly with WASI Preview 1 (WebAssembly System Interface) support. This target enables building Rust programs that can run in WebAssembly runtimes with access to system-level capabilities like file I/O, environment variables, and command-line arguments through the WASI standard interface.

**Note**: This replaces the deprecated `wasm32-wasi` target in modern Rust toolchains.

## Installation

- **Method**: rustup target
- **Role Path**: `./ansible/roles/dev/wasm32-wasi`
- **Playbook**: `./ansible/playbooks/dev.yml`

### Manual Installation

```bash
cd ansible
ansible-playbook playbooks/dev.yml --tags wasm32-wasi
```

### Install with other WebAssembly tools

```bash
cd ansible
ansible-playbook playbooks/dev.yml --tags wasm,webassembly
```

## Configuration

No additional configuration required. The target is automatically available to Rust toolchain after installation.

## Usage

### Compile Rust code for wasm32-wasip1

```bash
cargo build --target wasm32-wasip1
```

### Create a new project optimized for WebAssembly

```bash
cargo new my-wasm-project
cd my-wasm-project
cargo build --target wasm32-wasip1 --release
```

### Run with Wasmtime (if installed)

```bash
wasmtime target/wasm32-wasip1/release/my-wasm-project.wasm
```

### Check available targets

```bash
rustup target list | grep wasm
```

## Dependencies

- Nix package manager
- rustup (installed via cargo role)
- Rust toolchain

## References

- [WASI Documentation](https://wasi.dev/)
- [Rust WebAssembly Book](https://rustwasm.github.io/docs/book/)
- [rustup Targets](https://rust-lang.github.io/rustup/cross-compilation.html)
