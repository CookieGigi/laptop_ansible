# rust-analyzer

## Overview

rust-analyzer is a Language Server Protocol (LSP) implementation for Rust. It
provides IDE-like features such as code completion, go-to-definition, find
references, and real-time diagnostics for Rust development.

## Installation

- **Method**: Nix
- **Role Path**: `./ansible/roles/dev/rust-analyzer`

## Configuration

Configure through your editor's LSP client. Most editors (Neovim, VSCode, etc.)
will automatically detect and use rust-analyzer when editing Rust files.

## Usage

rust-analyzer runs automatically when editing Rust files. Provides:

- Code completion for types, functions, and modules
- Hover documentation
- Go-to-definition and find-all-references
- Code navigation (go to implementation, type definition)
- Real-time error checking and diagnostics
- Inlay hints for types and parameter names
- Code actions (quick fixes, refactorings)
- Symbol search and outline
- Automatic imports

## Variables

| Variable | Description |
|----------|-------------|
| `nix_packages` | List of Nix packages to install (`nixpkgs#rust-analyzer`) |

## Dependencies

- Nix package manager
- LSP client in your editor
- Rust toolchain (rustc, cargo)
