# Claude Code

## Overview

Claude Code is Anthropic's official interactive CLI tool for working with Claude AI directly from the terminal. It provides a powerful command-line interface for AI-assisted development tasks.

## Installation

- **Method**: Official install script (curl)
- **Install Script**: `https://claude.ai/install.sh`
- **Role Path**: `ansible/roles/dev/claude-code`

## Installation Location

- **Binary**: `~/.local/bin/claude` (typically)
- **Config Directory**: `~/.claude/`
- **Downloads**: `~/.claude/downloads/` (temporary)

## Configuration

Claude Code is configured through its own configuration files located in `~/.claude/`.

## Usage

```bash
# Check version
claude --version

# Start Claude Code
claude
```

Claude Code provides an interactive terminal interface for:

- Code generation and editing
- Debugging assistance
- Code review
- Terminal command execution
- AI-assisted development tasks

## Variables

None - uses official install script.

## Dependencies

- curl or wget
- bash
- sha256sum (Linux) or shasum (macOS)

## Notes

- The install script automatically detects platform (Linux/macOS) and architecture (x64/arm64)
- Verifies downloads with SHA256 checksums
- Handles both glibc and musl-based Linux distributions
- Automatically sets up shell integration
