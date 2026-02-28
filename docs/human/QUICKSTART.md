# Quick Start

One-time setup to get your system ready.

## Bootstrap

```bash
# Install package managers (Nix, Flatpak, pipx)
make bootstrap
```

## Setup

```bash
# Configure shell, terminal, fonts
make setup
```

## Install Groups

```bash
# Install development tools
make install GROUP=dev-rust
make install GROUP=dev-python

# See all available groups
make list
```

## Apply Preset

```bash
# Install everything for a workstation
make preset NAME=workstation
```

## Check Status

```bash
# See what's installed
make status
```

---

**Available Groups**: core, dev-base, dev-rust, dev-python, dev-k8s, gaming, productivity, creative, web, ai-tools

**Available Presets**: minimal, workstation, gaming-rig, laptop, server
