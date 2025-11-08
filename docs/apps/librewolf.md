# LibreWolf

## Overview

LibreWolf is a privacy-focused fork of Firefox, designed to enhance security and privacy by removing telemetry and
proprietary components.

## Installation

- **Method**: Flatpak
- **Command**: `flatpak install --user flathub io.gitlab.librewolf-community`
- **Ansible Role**: [`/ansible/roles/app/librewolf`](file:///home/cookiegigi/Project/system_maintain/ansible/roles/app/librewolf)

## Configuration

- **Main Config Path**: `~/.var/app/io.gitlab.librewolf-community/.librewolf/`
- **Files**:
  - `librewolf.overrides.cfg`: Configuration overrides for LibreWolf

## Usage

LibreWolf is used for privacy-focused web browsing.

## Variables

| Variable | Description |
|----------|-------------|
| `librewolf_package` | Flatpak ID for LibreWolf (`io.gitlab.librewolf-community`) |
| `librewolf_var_path` | Configuration path for LibreWolf (`~/.var/app/io.gitlab.librewolf-community/.librewolf`) |

## Dependencies

- Flatpak
- Flathub repository
